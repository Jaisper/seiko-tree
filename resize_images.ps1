# resize-images.ps1
# Beskærer og resizer alle billeder i img\ til 420x280px (optimal popup-størrelse)
# Koer: powershell -ExecutionPolicy Bypass -File resize-images.ps1

Add-Type -AssemblyName System.Drawing

$targetW = 420
$targetH = 280
$quality = 85
$folder = "img"

Write-Host "`n=== Seiko Family Tree - Image Resizer ===" -ForegroundColor Cyan
Write-Host "Target: ${targetW}x${targetH}px (2x retina), quality $quality%" -ForegroundColor White
Write-Host ""

if (!(Test-Path $folder)) {
    Write-Host "  Mappen 'img' findes ikke!" -ForegroundColor Red
    Read-Host "Tryk Enter"
    exit
}

# Backup original images
$backupDir = "img_original"
if (!(Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
    Write-Host "  Backup af originaler gemmes i img_original\" -ForegroundColor Yellow
}

$files = Get-ChildItem "$folder\*" -Include *.jpg,*.jpeg,*.png,*.webp
$count = 0
$skipped = 0

foreach ($file in $files) {
    Write-Host -NoNewline "  $($file.Name) ... "

    try {
        # Load image
        $img = [System.Drawing.Image]::FromFile($file.FullName)
        $srcW = $img.Width
        $srcH = $img.Height

        # Already correct size?
        if ($srcW -eq $targetW -and $srcH -eq $targetH) {
            Write-Host "already ${targetW}x${targetH}, skip" -ForegroundColor Gray
            $img.Dispose()
            $skipped++
            continue
        }

        # Calculate crop region (center crop to target aspect ratio)
        $targetRatio = $targetW / $targetH  # 1.5
        $srcRatio = $srcW / $srcH

        if ($srcRatio -gt $targetRatio) {
            # Source is wider - crop sides
            $cropH = $srcH
            $cropW = [int]($srcH * $targetRatio)
            $cropX = [int](($srcW - $cropW) / 2)
            $cropY = 0
        }
        else {
            # Source is taller - crop top/bottom (bias slightly upward to catch dial)
            $cropW = $srcW
            $cropH = [int]($srcW / $targetRatio)
            $cropX = 0
            $cropY = [int](($srcH - $cropH) * 0.35)  # 35% from top — catches watch face
        }

        # Clamp values
        if ($cropX -lt 0) { $cropX = 0 }
        if ($cropY -lt 0) { $cropY = 0 }
        if ($cropX + $cropW -gt $srcW) { $cropW = $srcW - $cropX }
        if ($cropY + $cropH -gt $srcH) { $cropH = $srcH - $cropY }

        # Crop and resize
        $cropRect = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropW, $cropH)
        $bitmap = New-Object System.Drawing.Bitmap($targetW, $targetH)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $destRect = New-Object System.Drawing.Rectangle(0, 0, $targetW, $targetH)
        $graphics.DrawImage($img, $destRect, $cropRect, [System.Drawing.GraphicsUnit]::Pixel)

        $img.Dispose()
        $graphics.Dispose()

        # Backup original
        $backupPath = Join-Path $backupDir $file.Name
        if (!(Test-Path $backupPath)) {
            Copy-Item $file.FullName $backupPath
        }

        # Save as JPG with quality setting
        $encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
        $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
        $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, $quality)

        # Save to temp, then replace (can't overwrite while loaded)
        $tempPath = "$($file.FullName).tmp"
        $bitmap.Save($tempPath, $encoder, $encoderParams)
        $bitmap.Dispose()

        # Replace original with resized
        Remove-Item $file.FullName -Force
        Rename-Item $tempPath $file.Name

        $newSize = [math]::Round((Get-Item $file.FullName).Length / 1024)
        Write-Host "${srcW}x${srcH} -> ${targetW}x${targetH} (${newSize}KB)" -ForegroundColor Green
        $count++
    }
    catch {
        Write-Host "FEJL: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n  Resized: $count   Skipped: $skipped   Total: $($files.Count)" -ForegroundColor White
Write-Host "  Originaler gemt i: $backupDir\" -ForegroundColor Yellow
Write-Host "`nTryk Enter..." -ForegroundColor Gray
Read-Host