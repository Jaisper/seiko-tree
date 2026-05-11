# Seiko — A Curated Mechanical Family Tree (1960–2025)

An interactive, single-file visualization of Seiko's mechanical watch heritage from 1960 to 2025 — covering Suwa Seikosha, Daini/Kameido, Grand Seiko, King Seiko, divers, chronographs, Spring Drive, and the modern collection era.

🔗 **Live site:** [jaisper.github.io/seiko-tree](https://jaisper.github.io/seiko-tree)

## What this is

A curated genealogy of Seiko's mechanical watch families, organized as a three-era visual model:

- **Vintage Factory Era (1960–c. 1988)** — Suwa Seikosha and Daini/Kameido as parallel in-house production centers
- **Legacy Transition (c. 1988–2001)** — the dormancy and revival period: 1988 GS quartz return, 1998 9S mechanical revival, 1999 7R68 Spring Drive, the 4S bridge family, 7002 and SKX divers
- **Modern Collection Era (2001–2025)** — today's globally consolidated brand architecture: Grand Seiko, King Seiko, Prospex, Presage, Seiko 5 Sports

The diagram traces caliber lineages, platform families, market succession, design influence, brand revival, and modern heritage reinterpretations. **It is a curated interpretive model — not an official Seiko genealogy.**

## What this isn't

- Not a complete reference catalogue
- Not a strict caliber genealogy (those branch in many directions a single 2D layout can't capture)
- Not authoritative Seiko corporate history — editorial choices have been made about era boundaries, model groupings, and which relations count as direct lineage vs. design influence
- Not an investment guide or pricing reference

## Features

- **Interactive map** — zoom, pan, double-click to zoom toward a point
- **Click any node** to lock and trace its lineage (ancestors and descendants)
- **Filter** by Diver / Chrono / Grand Seiko / King Seiko, plus an "Iconic" modifier
- **Hover edges** to see relation type and historical context
- **Five guided tours** narrating curated journeys through the diagram:
  - Marvel to U.F.A. — 65 Years of Grand Seiko
  - Divers Through the Ages
  - Race for the First Auto-Chronograph (1969)
  - Spring Drive — Twenty Years of Pursuit
  - Grammar of Design — Tanaka's Rules
- **Tech badges** on nodes — 10B (36,000 vph Hi-Beat), 8B (28,800 vph), SD (Spring Drive), Q (Quartz)
- **Iconic-model markers** (★) for landmark references
- **Minimap** with viewport indicator
- **Keyboard accessible** — Tab through nodes, Enter/Space to lock, Esc to clear
- **Mobile-responsive** with pinch-to-zoom

## How to use

### Online
Just open [jaisper.github.io/seiko-tree](https://jaisper.github.io/seiko-tree) in a browser. Works on desktop and mobile.

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

## Sources and methodology

The data is compiled from a wide range of references, including:

- Seiko Group / Seiko Watch Corporation official history pages (chronology, "Our Heritage", Brand 100 Stories)
- Grand Seiko / GS9 Club historical material
- Seiko Museum Ginza historical pages
- Plus9Time, The Grand Seiko Guy, Worn & Wound, Fratello and other established enthusiast publications
- Reference works such as the Dragonfly Publishing JDM watch series for vintage caliber and case-reference detail

For sensitive or contested claims (Antarctic expedition use of the 62MAS, the 1968 Tuna diver letter, individual model release years), the descriptions are kept appropriately tentative and primary-source-aware.

If you spot factual errors or have better-sourced corrections, please [open an issue](https://github.com/Jaisper/seiko-tree/issues).

## Reading the diagram

**Edge weight encodes relation strength:**

| Line | Meaning |
|------|---------|
| Solid bold | Caliber / platform lineage — direct movement or platform succession |
| Solid thin | Product succession or platform relation — same family, different model |
| Dashed | Design influence or heritage reinterpretation — not a direct technical line |

**Hover any edge** to see the specific historical claim being made.

**Color groups** roughly indicate family membership (Suwa, Daini/Kameido, Diver, Chrono, Grand Seiko, King Seiko, Bell-Matic, World Time, Prospex, Presage, Seiko 5, Modern). They are visual aids — the actual taxonomy is in the popup descriptions.

## Tech

Single-file HTML/JS, no framework, no build step:

- ~140 KB total (one file, includes everything)
- Vanilla JavaScript, no dependencies
- Pure SVG for edges, HTML/CSS for nodes
- Google Fonts: Noto Serif (intro prose), Cormorant Garamond (titles, popups), IBM Plex Mono (UI labels)

The whole thing is designed to load fast on a phone, run from GitHub Pages without any server, and be easy to fork and extend.

## Contributing

This is a personal project, but corrections are welcome. The most useful contributions are:

- **Factual corrections** with citations to good sources
- **Missing important models** with a clear case for inclusion
- **Better edge phrasings** where the current relation description over- or under-claims

Please [open an issue](https://github.com/Jaisper/seiko-tree/issues) or PR. For larger structural suggestions, please open an issue first to discuss.

## License

The code is MIT-licensed — fork freely. The curated content (edge claims, era framing, popup descriptions) is © Jesper Lippert and offered for personal and educational use; please credit and link back if you reuse substantial portions.

Watch and brand names are trademarks of their respective owners and used here for identification only.

## Acknowledgments

This project is the work of an enthusiast, not a Seiko employee. It owes everything to the long tradition of Seiko collectors, archivists, and writers who have done the real research over decades. Thanks especially to the wider community and Seiko's own design-history publications.
