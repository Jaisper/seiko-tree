# Seiko — A Curated Mechanical Family Tree (1960–2025)

Greetings, fellow Seiko enthusiasts. I have had a long-standing interest in Seiko watches, especially the mechanical vintage lines. Over time, however, the sheer number of models, calibres, factories, sub-brands, and product families made it difficult — at least for me... ;-) — to grasp "the bigger picture".

So I set out to create a map of Seiko's mechanical watch heritage from 1960 to 2025: covering Suwa Seikosha, Daini/Kameido, Grand Seiko, King Seiko, divers, chronographs, Spring Drive, and the modern collection era. I think it has turned out pretty good, and I am now sharing it for fellow enthusiasts to explore, use, challenge, and improve.

I hope you find it useful!

Best  
Jesper

🔗 **Live site:** [jaisper.github.io/seiko-tree](https://jaisper.github.io/seiko-tree)

📎 **Companion project:** [jaisper.github.io/seiko-calibers](https://jaisper.github.io/seiko-calibers) — the same story told through movement genealogy rather than watch families

## What this is

A curated genealogy of Seiko's mechanical watch families, organized as a three-era visual model:

- **Vintage Factory Era (1960–c. 1988)** — Suwa Seikosha and Daini Seikosha/Kameido as parallel in-house production centers, becoming Seiko Epson and Seiko Instruments in the 1983 corporate restructuring
- **Legacy Transition (c. 1988–2001)** — the dormancy and revival period: 1988 GS quartz return, 1998 9S mechanical revival, 1999 7R68 Spring Drive, the 4S bridge family, 7002 and SKX divers
- **Modern Collection Era (2001–2025)** — today's globally consolidated brand architecture: Grand Seiko (independent brand 2017), King Seiko (revived 2022), Prospex (2014), Presage (global 2016), and Seiko 5 Sports (rebooted 2019)

The diagram traces caliber lineages, platform families, market succession, design influence, brand revival, and modern heritage reinterpretations. It also includes a "prehistory" section covering 1881–1955 (Kintaro Hattori, Seikosha, Laurel 1913, 1923 Kantō earthquake, 1924 "Seiko" brand, Daini formalization in 1937, 1948 accuracy competitions).

**It is a curated interpretive model — not an official Seiko genealogy.**

## What this isn't

- Not a complete reference catalogue (sub-variants like 4520 VFA, 6155/6156 61GS Special are largely omitted for clarity)
- Not a strict caliber genealogy — for that, see the companion [Seiko Caliber Family Tree](https://jaisper.github.io/seiko-calibers)
- Not authoritative Seiko corporate history — editorial choices have been made about era boundaries, model groupings, and which relations count as direct lineage vs. design influence
- Not an investment guide or pricing reference
- Not a Kinetic or quartz reference — the scope is strictly high-grade mechanical (including Spring Drive as an electro-mechanical hybrid)

## Features

- **Interactive map** — zoom, pan, double-click to zoom toward a point; minimap with viewport indicator
- **Click any node** to lock and trace its lineage (ancestors and descendants light up, others dim)
- **Filter** by Diver / Chrono / Grand Seiko / King Seiko / Iconic / 10B Hi-Beat / SD Spring Drive
- **Search** — freetext caliber/model search (searches names, eras, descriptions)
- **URL hash deep-linking** — `#node=62mas` opens with 62MAS locked and centred; `#tour=diver` starts the divers tour
- **Hover edges** to see the specific historical claim being made
- **Five guided tours** narrating curated journeys through the diagram:
  - Marvel to U.F.A. — 65 Years of Grand Seiko
  - Divers Through the Ages
  - Race for the First Auto-Chronograph (1969)
  - Spring Drive — Twenty-Five Years of Pursuit
  - Grammar of Design — Tanaka's Rules
- **Tech badges** — 10B (36,000 vph Hi-Beat), 8B (28,800 vph), SD (Spring Drive)
- **Iconic-model markers** (★) for landmark references
- **Keyboard accessible** — Tab through nodes, Enter/Space to lock, Esc to clear
- **Mobile-responsive** with pinch-to-zoom and touch tooltips
- **Foldable intro** — short intro at the top, "Read more" for historical summary, separate "Methodology guide" button for axis conventions and line-weight legend
- **Dev validator** — append `?debug=1` to the URL and open the browser console to see data-integrity warnings (missing edges, unknown ids, label/era year mismatches)

## How to use

### Online
Open [jaisper.github.io/seiko-tree](https://jaisper.github.io/seiko-tree) in a browser. Works on desktop and mobile.

### Local
Clone or download `index.html` and open it in any modern browser. No build step, no dependencies, no server required.

```bash
git clone https://github.com/Jaisper/seiko-tree.git
cd seiko-tree
open index.html      # macOS
xdg-open index.html  # Linux
start index.html     # Windows
```

### Embed
The page is a single self-contained HTML file. Embed via iframe:

```html
<iframe src="https://jaisper.github.io/seiko-tree/" width="100%" height="900" frameborder="0"></iframe>
```

## Reading the diagram

**Two axes:**

- **Horizontal (Chronology)** — time flows left to right through three eras (Vintage → Legacy Transition → Modern)
- **Vertical (Structure)** — during Vintage, the grid splits Suwa Seikosha (upper) from Daini Seikosha (lower) to highlight the internal rivalry; in Modern, the vertical stack represents the five collection pillars

**Three edge weights:**

| Line | Meaning |
|------|---------|
| Solid bold (strong) | Direct caliber / platform lineage — e.g. `marvel → crown → gs_1st` |
| Solid thin (medium) | Product succession, market continuation, or movement siblings |
| Dashed (weak) | Design influence, heritage reinterpretation, or revival programme without continuous movement inheritance — e.g. `62mas → px_1965` |

Hover any edge to see the specific historical claim being made.

The in-app "Methodology guide" (opened via the dedicated button below the intro) covers this in more depth and lists methodological boundaries.

## How the file is organized

The whole project is one `index.html` file. Inside the `<script>` block at the bottom, the code is divided into nine clearly-marked sections — jump straight to the one you need to edit.

```
SECTION 1 · COLOUR PALETTE           — visual grouping colours
SECTION 2 · TECH BADGES              — 10B/8B/SD badges on nodes
SECTION 3 · COLLECTION OWNERSHIP     — personal "In Collection" markers
SECTION 4 · WATCH DATA               — popupData (descriptions, eras, tags)
SECTION 5 · LAYOUT                   — declarative grid; pixel x/y auto-computed
SECTION 6 · RELATIONSHIPS            — edges (lines between nodes)
SECTION 7 · FILTER TAGS              — nodeTags (for category filtering)
SECTION 8 · GUIDED TOURS             — narrated walk-throughs
SECTION 9 · RENDERING & INTERACTION  — the engine (usually no edits needed)
```

Container boxes (factory boxes, family sub-boxes) are auto-generated by the engine from Section 5 — there's no separate "sections" array to maintain.

## How the layout works

The diagram is laid out as a **grid** within each family. You don't compute pixel coordinates by hand — you place a watch at a `(row, column)` cell and the engine takes care of the rest.

Each family looks like this:

```js
/* ─── KING SEIKO · DAINI ORIGIN ─── */
{
  label: "KING SEIKO · DAINI ORIGIN",
  color: C.ks,
  grid: "suwa7",                            // 7-column grid
  sectionX: 15, sectionY: 1490, sectionW: 1135,
  rows: [
    ["cronos",    "ks_1st",   "ks_hack",  "ks_chrono", "45ks"                              ],
    ["cronos_sp", _,          _,          "44ks",      "44ks_sp",  "vanac",    "vanac_sp"],
    ["cronos_sd", _,          _,          _,           _,          _,          "52ks"    ],
  ]
}
```

Each row is a list of cell positions. `_` is the placeholder for an empty cell. The engine reads this and computes x/y for every watch, then sizes the section box automatically.

Column grids used in the diagram (Vintage / Legacy / Modern regions):

| Grid       | Used by                          | Columns |
|------------|----------------------------------|---------|
| `suwa7`    | Vintage Factory Era (Suwa+Daini) | 7 columns spanning x=15 to x=1082 |
| `legacy2`  | Legacy Transition                | 2 columns spanning x=1090 to x=1498 |
| `modern5`  | Modern Collection Era            | 5 columns spanning x=1506 to x=2416 |

The three parent regions have 8px gaps between them for clear visual separation. All grids use a 65px row stride by default.

The big outer container boxes (SUWA SEIKOSHA, DAINI SEIKOSHA, LEGACY TRANSITION, MODERN COLLECTION) are declared once in `LAYOUT.parents` — the engine renders them under the families.

## Contributing

Contributions of all kinds are welcome — corrections, missing models, better wording.

### Quick edit recipes

**Fix a typo or improve a watch description**
- Go to Section 4 (`const popupData`)
- Search for the watch's id (e.g. `62mas:`)
- Edit the `d:"..."` text

**Correct a year on a node**
- Section 4 — fix the `era:"..."` text in the popup
- Section 5 (`nodeLabels`) — fix the visible label on the box (the `\n` is a line break)
- If the year change shifts the intended column, also move the id to a new cell in the grid (Section 5)

**Add a new watch**

1. **Pick a unique id** — lowercase, snake_case (e.g. `ks_special_72`).
2. **In Section 4**, add an entry to `popupData` in the right family group:
   ```js
   ks_special_72: {n:"KS Special 1972", era:"1972", d:"Brief history...", tags:["ks"]},
   ```
3. **In Section 5**, add the visible label to `nodeLabels`:
   ```js
   ks_special_72: "KS Special\n1972",
   ```
   (Optionally set `iconFlags.ks_special_72 = 1` if it deserves a ★.)
4. **In Section 5**, drop the id into a cell in the right family's grid.
5. **In Section 6** (optional), add edges linking it to other watches:
   ```js
   ["44ks", "ks_special_72", "medium", "Special variant of the 44KS design"],
   ```
6. **In Section 7** (optional), add filter tags.

**Add a relationship between two watches**

Go to Section 6 (`const edges`) and add a line:
```js
["from_id", "to_id", "type", "Description shown on hover", "relation"]
```
- `type`: `"strong"` (caliber/platform lineage), `"medium"` (product succession/siblings), or `"weak"` (design influence/heritage)
- `relation`: optional refinement — see the comment in Section 6

**Validate your changes**

Open the file with `?debug=1` in the URL (e.g. `file:///path/to/index.html?debug=1`) and check the browser console. The validator will warn about:
- popupData ids not rendered in the LAYOUT
- edge endpoints referencing unknown ids
- techMap / nodeTags entries for non-existent nodes
- label/era year mismatches

### When to open an issue vs. a PR

- **Issue first**: anything structural (era boundaries, family groupings, removing/renaming a node)
- **PR directly**: factual corrections, better wording, individual missing watches, edge corrections
- Please cite a source for factual claims when you can

## Sources and methodology

The data is compiled from a wide range of primary corporate documentation, specialist enthusiast scholarship, and reference community sources. Where sources conflict, the more authoritative or the more recently verified account is used; ambiguities are flagged in individual node descriptions.

### Primary corporate sources

- **Seiko Watch Corporation, *"A Journey in Time"*** (John Goodall, 2003) — the 125th-anniversary book, authoritative for founding history, factory rivalry, and vintage production years (Marvel 1956–59, 62MAS 1965, 6215 1967, 44GS 1967, 45GS 1968, 56KS 1969, 1948 accuracy competitions)
- **[grand-seiko.com](https://www.grand-seiko.com/global-en/history/)** — official history, timeline, and press releases (Spring Drive milestones, 7R88 as manual-wind, 9R65 as first automatic Spring Drive, 9RA5 5.0mm specification, Tentagraph)
- **[Seiko Museum Ginza](https://museum.seiko.co.jp/en/knowledge/)** — caliber genealogy, especially Cal. 341/3180 first-GS lineage
- **[Seiko Design 140 anniversary site](https://by.seiko-design.com/140th/en/)** — SUS 1995 launch, Vanac 1972–78, dress-caliber lineage
- **[GS9 Club](https://grandseikogs9club.com/)** — modern Grand Seiko references (SLGC001 Tentagraph, SBGC201, SBGC240)

### Specialist enthusiast scholarship

- **[TheSeikoGuy](https://www.theseikoguy.com/)** (Andrea Secco) — vintage Seiko wristwatch history, 62MAS designer attribution (Tanaka + Akabane), Cronos Waterproof, Slim Turtle guides
- **[Plus9Time](https://www.plus9time.com/)** (Anthony Kable) — modern GS database, 44/45/56KS caliber genealogy, extensive Seiko catalog and press-release archives
- **[SJX Watches](https://watchesbysjx.com/)** (Su Jia Xian) — modern GS releases, Spring Drive chronograph coverage, 8R46 Speedtimer differentiation
- **[Wadokei](https://www.wadokei.me/)** — Taro Tanaka and Ren Tanaka biographical research (used to correct the widespread myth that Tanaka worked at Suwa; he led K. Hattori's central design department from 1959)
- **[Grail Watch Reference](https://reference.grail-watch.com/)** — technical caliber specifications (4S15/25/35 base variants)
- **[Caliber Corner](https://calibercorner.com/)** — modern 4R/6R/NH caliber reference specs
- **[Rescapement](https://www.rescapement.com/)** and **[namokiMODS](https://www.namokimods.com/)** — Grammar of Design analysis and Tanaka biographical context

### Reference and community

- Watch-and-Vintage and Frame Watch Works — 5606 Lord Matic day-date confirmation
- Watchspot — Bell-Matic 4006A "dolphin caseback" variant analysis
- Wikipedia and Grokipedia entries on Seikosha, Daini, Suwa, Morioka Seiko Kogyo — corporate restructuring dates (1928 Kameido, 1937 Daini formalization, 1970 Morioka, 1983 Seiko Instruments & Electronics, 1997 Seiko Instruments Inc.)
- [WatchUseek](https://www.watchuseek.com/) Seiko/Citizen sub-forum (SCWF) — community catalogue verification
- Chrono24 historical catalogues — vintage reference data
- Fratello, aBlogtoWatch, Worn & Wound, Wristreview, Master Horologer — modern release coverage (8L55 SBEX001 Baselworld 2015, 6L35 SJE073 Baselworld 2018)

For sensitive or contested claims (Antarctic expedition use of the 62MAS, the 1968 Tuna diver letter, individual model release years), the descriptions are kept appropriately tentative and primary-source-aware.

## Editorial history

Some of the notable rounds of factual correction and structural refinement include:

- **2026-07** — Full validation against the Seiko 2003 anniversary book; Marvel corrected from 1956–62 to 1956–59; 56KS Suwa corrected from 1968–75 to 1969–75; 7R88 corrected from "first automatic Spring Drive" to "manual-wind refinement"; Taro Tanaka corrected from "joined Daini" to "joined K. Hattori central design"; 19GS caliber corrected from Cal. 1944 (Daini) to Cal. 1964 (Suwa); 4S caliber list corrected from 4S15/25/36 to 4S15/25/35; Cronos Special era corrected from 1959–62 to 1962–64
- **2026-06/07** — Multiple external AI review rounds (ChatGPT/Fable, storebror 4.8, TheSeikoGuy) with genuine corrections applied and hallucinated suggestions rejected. Filter bug, 6105 dublet, 6138 bi-compax, missing Hi-Beat badges resolved. Bell-Matic 4005/4006 relationship reversed (4006 is the original 1966 platform; 4005 is a later 1968–69 date-only sibling)
- **2026-04/05** — Grid-based declarative layout system introduced (replacing hand-tuned pixel coordinates); nine-section code structure; touch tooltips, URL hash deep-linking, freetext search, multi-select filters, guided tours
- **2026-04** — Public/private split; comprehensive editorial rewrite softening overclaims to curated interpretive tone

## Tech

Single-file HTML/JS, no framework, no build step:

- ~200 KB total (one file, includes everything)
- Vanilla JavaScript, no dependencies
- Pure SVG for edges, HTML/CSS for nodes
- Google Fonts: Noto Serif (intro prose, popups, methodology), IBM Plex Mono (UI labels, tech badges, node years)
- Declarative grid layout — the `buildLayout()` engine (Section 9) converts `LAYOUT` into pixel coordinates at startup
- Dev validator behind `?debug=1` for post-edit integrity checks

The whole thing is designed to load fast on a phone, run from GitHub Pages without any server, and be easy to fork and extend.

## License

The code is MIT-licensed — fork freely. The curated content (edge claims, era framing, popup descriptions, methodology guide) is © Jesper Lippert and offered for personal and educational use; please credit and link back if you reuse substantial portions.

Watch and brand names are trademarks of their respective owners and used here for identification only.

## Acknowledgments

This project is the work of an enthusiast, not a Seiko employee. It owes everything to the long tradition of Seiko collectors, archivists, and writers who have done the real research over decades — most directly Andrea Secco (TheSeikoGuy), Anthony Kable (Plus9Time), Su Jia Xian (SJX Watches), and the anonymous Wadokei author whose Tanaka research corrected long-standing myths in the enthusiast literature.

Thanks also to the /r/Watches community, the WatchUseek SCWF forum, and Seiko's own design-history publications (particularly the 2003 anniversary book and the 140th anniversary site) which made much of this genealogy verifiable.
