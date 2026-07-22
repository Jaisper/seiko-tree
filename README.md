# Seiko — A Curated Mechanical Family Tree (1956–2025)

Greetings, fellow Seiko enthusiasts. I have had a long-standing interest in Seiko watches, especially the mechanical vintage lines. Over time, however, the sheer number of models, calibres, factories, sub-brands, and product families made it difficult — at least for me... ;-) — to grasp "the bigger picture".

So I set out to create a map of Seiko's mechanical watch heritage from 1956 to 2025: covering Suwa Seikosha, Daini/Kameido, Grand Seiko, King Seiko, divers, chronographs, Spring Drive, and the modern collection era. I think it has turned out pretty good, and I am now sharing it for fellow enthusiasts to explore, use, challenge, and improve.

I hope you find it useful!

Best  
Jesper

🔗 **Live site:** [jaisper.github.io/seiko-tree](https://jaisper.github.io/seiko-tree)

📎 **Companion project:** [jaisper.github.io/seiko-calibers](https://jaisper.github.io/seiko-calibers) — the same story told through movement genealogy rather than watch families

## What this is

A curated genealogy of Seiko's mechanical watch families, organized as a three-era visual model:

- **Vintage Factory Era (1956–c. 1988)** — Suwa Seikosha and Daini Seikosha/Kameido as parallel in-house production centers, reorganized into Seiko Epson (1985) and Seiko Instruments (1983)
- **Legacy Transition (c. 1988–2001)** — the dormancy and revival period: 1988 GS quartz return, 1998 9S mechanical revival, 1999 7R68 Spring Drive, the 4S bridge family, 7002 and SKX divers
- **Modern Collection Era (2001–2025)** — today's globally consolidated brand architecture: Grand Seiko (independent brand 2017), King Seiko (revived 2022), Prospex (2014), Presage (global 2016), and Seiko 5 Sports (rebooted 2019)

The diagram traces caliber lineages, platform families, market succession, design influence, brand revival, and modern heritage reinterpretations. It also includes a "prehistory" section covering 1881–1955 (Kintaro Hattori, Seikosha, Laurel 1913, 1923 Kantō earthquake, 1924 "Seiko" brand, Daini formalization in 1937, 1948 accuracy competitions).

**It is a curated interpretive model — not an official Seiko genealogy.**

## What this isn't

- Not a complete reference catalogue (many sub-variants are omitted for clarity)
- Not a strict caliber genealogy — for that, see the companion [Seiko Caliber Family Tree](https://jaisper.github.io/seiko-calibers)
- Not authoritative Seiko corporate history — editorial choices have been made about era boundaries, model groupings, and which relations count as direct lineage vs. design influence
- Not an investment guide or pricing reference
- Not a Kinetic or quartz reference — the scope is strictly high-grade mechanical (including Spring Drive as an electro-mechanical hybrid)

## Features

- **Interactive map** — zoom, pan, double-click to zoom toward a point; minimap with viewport indicator
- **Click any node** to lock and trace its lineage (ancestors and descendants light up, others dim)
- **Filter** by Diver / Chrono / Grand Seiko / King Seiko / Iconic / 10B Hi-Beat / SD Spring Drive
- **Search** — freetext model/caliber search (searches names, eras, and descriptions)
- **URL hash deep-linking** — `#node=62mas` opens with 62MAS locked and centred; `#tour=diver` starts the divers tour
- **Hover edges** to see the specific historical claim being made
- **Five guided tours** narrating curated journeys through the diagram:
  - Marvel to U.F.A. — 65 Years of Grand Seiko
  - Divers Through the Ages
  - Race for the First Auto-Chronograph (1969)
  - Spring Drive — Twenty Years of Pursuit
  - Grammar of Design — Tanaka's Rules
- **Tech badges** — 10B (36,000 vph Hi-Beat), 8B (28,800 vph), SD (Spring Drive), Q (Quartz)
- **Iconic-model markers** (★) for landmark references
- **Keyboard accessible** — Tab through nodes, Enter/Space to lock, Esc to clear
- **Mobile-responsive** with pinch-to-zoom and touch tooltips
- **Foldable intro** — short intro at the top, "Read more" for the historical summary, separate "Methodology guide" button for axis conventions and the line-weight legend
- **Built-in validator** — data-integrity checks run on every load and print warnings to the browser console (append `?debug=1` for an extra summary line)

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

- **Horizontal (Chronology)** — time flows left to right through three eras (Vintage → Legacy Transition → Modern). Within a family box, position indicates approximate release order rather than a strict year scale
- **Vertical (Structure)** — during Vintage, the grid splits Suwa Seikosha (upper) from Daini Seikosha (lower) to highlight the internal rivalry; in Modern, the vertical stack represents the collection pillars. Within a family, a row is often one lineage branch or one technology track

**Three edge weights:**

| Line | Meaning |
|------|---------|
| Solid bold (strong) | Direct caliber / platform lineage — e.g. `marvel → crown → gs_1st` |
| Solid thin (medium) | Product succession, market continuation, or movement siblings |
| Dashed (weak) | Design influence, heritage reinterpretation, or revival programme without continuous movement inheritance — e.g. `62mas → px_1965` |

Hover any edge to see the specific historical claim being made. The in-app "Methodology guide" (opened via the dedicated button below the intro) covers this in more depth.

## How the file is organized

The whole project is one `index.html` file. Inside the `<script>` block at the bottom, the code is divided into eight clearly-marked sections — jump straight to the one you need to edit.

```
SECTION 1 · COLOUR PALETTE            — the C palette; single source of truth,
                                        pushed into CSS variables at startup
SECTION 2 · WATCH DATA (`watches`)    — ONE entry per watch: name, era, node
                                        label, popup text, icon flag, tech
                                        badge, filter tags — all in one place
SECTION 3 · COLLECTION OWNERSHIP      — personal "In Collection" markers
SECTION 4 · LAYOUT                    — declarative grid; pixel x/y auto-computed
SECTION 5 · RELATIONSHIPS             — edges (named-field objects)
SECTION 6 · RENDERING & INTERACTION   — the engine (usually no edits needed)
SECTION 7 · GUIDED TOURS              — narrated walk-throughs
SECTION 8 · VALIDATOR & BOOT          — data-integrity checks (always on)
```

The most important change from earlier versions: **everything about a watch now lives in one `watches` entry.** The old parallel maps (`popupData`, `nodeLabels`, `iconFlags`, `techMap`, `nodeTags`) are gone — they are now derived automatically from `watches` at startup. That means adding or fixing a watch is at most **two edits** instead of five, and a whole class of "the label says 1971 but the popup says 1970" bugs simply can't happen.

Container boxes (era/factory boxes and family sub-boxes) are auto-generated by the engine from the `LAYOUT` — there is no separate "sections" array to maintain.

## How the layout works

The diagram is laid out as a **grid** within each family. You don't compute pixel coordinates by hand — you place a watch at a `(row, column)` cell and the engine (`buildLayout()`, Section 6) computes every x/y and sizes the boxes.

The structure has two levels:

**Parents** (Section 4, `LAYOUT.parents`) are the big era/factory containers. Each declares how many grid columns it spans and how it is positioned relative to the others:

```js
{ key:"suwa",   label:"SUWA SEIKOSHA · …",  color:C.suwa,    columns:7 },
{ key:"daini",  label:"DAINI SEIKOSHA · …", color:C.kameido, columns:7, stackAfter:"suwa"  },
{ key:"legacy", label:"LEGACY TRANSITION …", color:C.modern,  columns:3, sideAfter:"suwa"   },
{ key:"modern", label:"MODERN COLLECTION …", color:C.modern,  columns:6, sideAfter:"legacy" },
```

`stackAfter` places a parent below another; `sideAfter` places it to the right. Everything else (x, y, width, height) is derived.

**Families** (Section 4, `LAYOUT.families`) are the sub-boxes inside a parent. Each is a grid of rows; `_` is an empty cell:

```js
/* ─── KING SEIKO · DAINI ORIGIN ─── */
{
  label: "KING SEIKO · DAINI ORIGIN",
  parent: "daini",
  color: C.ks,
  rows: [
    ["cronos",    "ks_1st", _,      "ks_44_9990",       "45ks",  _,        _         ],
    ["cronos_sp", _,        "44ks", "ks_44_self_dater", _,       "vanac",  "vanac_sp"],
    ["cronos_sd", _,        _,      "ks_44_chronometer",_,       _,        "52ks"    ],
  ]
}
```

The engine reads the family's `parent`, uses that parent's column grid, computes x/y for every id, and sizes the family box to fit its rows. Row stride, padding, and inter-box gaps are tunable in `LAYOUT.canvas` but default to sensible values.

## Contributing

Contributions of all kinds are welcome — corrections, missing models, better wording.

### Quick edit recipes

**Fix a typo or improve a watch description**
- Go to Section 2 (`const watches`)
- Search for the watch's id (e.g. `"62mas":`)
- Edit the `d:"..."` text. That's the only edit needed.

**Correct a year on a node**
- Section 2 — fix `era:"..."` (the popup) **and** the `label:"..."` (the visible box text; `\n` is a line break). If you omit `label`, the node label auto-derives as name + era, so for simple cases fixing `era` alone is enough.
- If the year change means the watch belongs in a different column, also move its id to a new cell in the family grid (Section 4).

**Add a new watch** — just **two** edits:

1. **In Section 2**, add one entry to `watches` with a unique lowercase snake_case id:
   ```js
   "ks_special_72": {
     n: "KS Special 1972",              // popup name (required)
     era: "1972",                        // popup year range (required)
     label: "KS Special\n1972",          // node box text (optional; defaults to n + era)
     d: "Brief history…",                // popup description (required)
     tags: ["ks"],                       // popup badges: icon/diver/chrono/gs/ks/hb/sd
     icon: 1,                            // optional: gold ★ border
     tech: "beat8",                      // optional badge: beat10/beat8/springdrive/quartz
     filters: ["ks"],                    // optional: category-filter membership
   },
   ```
2. **In Section 4**, drop the id into a cell in the right family's grid.

Optionally add edges (Section 5).

**Add a relationship between two watches**

Go to Section 5 (`const edges`) and add an object:
```js
{ f:"from_id", t:"to_id", w:"strong", d:"Description shown on hover", r:"same_platform" },
```
- `w` (weight): `"strong"` (caliber/platform lineage), `"medium"` (product succession/siblings), or `"weak"` (design influence/heritage)
- `r` (relation): optional refinement — `direct_lineage`, `same_platform`, `market_successor`, `design_influence`, `heritage_reinterpretation`, `brand_revival`, `technology_branch`, `collection_structure`, `conceptual`

**Validate your changes**

The validator runs automatically on every load — just open the file and check the browser console. Append `?debug=1` for a summary line. It warns about:
- `watches` entries not placed in the `LAYOUT` (and grid ids with no `watches` entry)
- edge endpoints referencing unknown ids
- duplicate edges (same from→to)
- unknown edge fields (catches typos like `wieght:` or `desc:`)
- guided-tour stops referencing unknown nodes
- label/era year mismatches

### When to open an issue vs. a PR

- **Issue first**: anything structural (era boundaries, family groupings, removing/renaming a node)
- **PR directly**: factual corrections, better wording, individual missing watches, edge corrections
- Please cite a source for factual claims when you can

## Sources and methodology

The data is compiled from primary corporate documentation, specialist enthusiast scholarship, and reference community sources. Where sources conflict, the more authoritative or the more recently verified account is used; ambiguities are flagged in individual node descriptions.

### Primary corporate sources

- **Seiko Watch Corporation, *"A Journey in Time"*** (John Goodall, 2003) — the 125th-anniversary book, authoritative for founding history, factory rivalry, and vintage production years
- **[grand-seiko.com](https://www.grand-seiko.com/global-en/history/)** — official history, timeline, and press releases (Spring Drive milestones, 9R65 as first automatic Spring Drive, 9RA5 specification, 9SA5 Dual Impulse Escapement, Tentagraph 9SC5, 60th-anniversary collection reorganization)
- **[Seiko Museum Ginza](https://museum.seiko.co.jp/en/knowledge/)** — caliber genealogy, especially Cal. 341/3180 first-GS lineage
- **[Seiko Design 140 anniversary site](https://by.seiko-design.com/140th/en/)** — SUS 1995 launch, Vanac 1972–78, dress-caliber lineage
- **[GS9 Club](https://grandseikogs9club.com/)** — modern Grand Seiko references

### Specialist enthusiast scholarship

- **[TheSeikoGuy](https://www.theseikoguy.com/)** (Andrea Secco) — vintage Seiko wristwatch history, 62MAS designer attribution (Tanaka + Akabane), Cronos Special dating, Slim Turtle guides
- **[Plus9Time](https://www.plus9time.com/)** (Anthony Kable) — modern GS database, 44/45/56KS caliber genealogy, extensive Seiko catalog and press-release archives, 56GS and 810 Cronos production years
- **[SJX Watches](https://watchesbysjx.com/)** (Su Jia Xian) — modern GS releases, Spring Drive chronograph coverage, 8R46 Speedtimer differentiation
- **[Wadokei](https://www.wadokei.me/)** — Taro Tanaka and Ren Tanaka biographical research (used to correct the widespread myth that Tanaka worked at Suwa; he led K. Hattori's central design department from 1959)
- **[Grail Watch Reference](https://reference.grail-watch.com/)** — technical caliber specifications (4S15/25/35 base variants)
- **[Caliber Corner](https://calibercorner.com/)** — modern 4R/6R/NH caliber reference specs
- **[Rescapement](https://www.rescapement.com/)** and **[namokiMODS](https://www.namokimods.com/)** — Grammar of Design analysis and Tanaka biographical context

### Reference and community

- Watch-and-Vintage — 5606 Lord Matic day-date confirmation, vintage caliber technical notes
- Wikipedia entries on Seikosha, Daini Seikosha, Suwa Seikosha, Morioka Seiko Kogyo — corporate restructuring dates (1937 Daini formalization, 1983 Seiko Instruments, 1985 Seiko Epson)
- [WatchUseek](https://www.watchuseek.com/) Seiko/Citizen sub-forum (SCWF) — community catalogue verification
- Chrono24 historical catalogues — vintage reference data
- Fratello, aBlogtoWatch, Worn & Wound, Master Horologer — modern release coverage (8L55 SBEX001 2015, 6L35 SJE073 2018, 6R54 1968 GMT 2023, 8R48 Speedtimer 2023)

For sensitive or contested claims (Antarctic expedition use of the 62MAS, the 1968 Tuna diver letter, individual model release years, the exact dating of the modern GS collection structure), the descriptions are kept appropriately tentative and primary-source-aware.

## Tech

Single-file HTML/JS, no framework, no build step:

- One self-contained file (`index.html`), no external assets beyond web fonts
- Vanilla JavaScript, no dependencies
- Pure SVG for edges, HTML/CSS for nodes
- Google Fonts: Cormorant Garamond (title, popups), IBM Plex Mono (UI labels, tech badges, node years), Noto Serif (intro prose, methodology)
- Single-source colour palette (`C`) pushed into CSS custom properties at startup, so a colour is edited in exactly one place
- Declarative grid layout — the `buildLayout()` engine converts `LAYOUT` into pixel coordinates at startup
- Edge hit-testing precomputes sampled points once per render, so hovering stays smooth even with ~180 edges
- Always-on validator for post-edit integrity checks

The whole thing is designed to load fast on a phone, run from GitHub Pages without any server, and be easy to fork and extend.

## License

The code is MIT-licensed — fork freely. The curated content (edge claims, era framing, popup descriptions, methodology guide) is © Jesper Lippert and offered for personal and educational use; please credit and link back if you reuse substantial portions.

Watch and brand names are trademarks of their respective owners and used here for identification only.

## Acknowledgments

This project is the work of an enthusiast, not a Seiko employee. It owes everything to the long tradition of Seiko collectors, archivists, and writers who have done the real research over decades — most directly Andrea Secco (TheSeikoGuy), Anthony Kable (Plus9Time), Su Jia Xian (SJX Watches), and the anonymous Wadokei author whose Tanaka research corrected long-standing myths in the enthusiast literature.

Thanks also to the enthusiast community, the WatchUseek SCWF forum, and Seiko's own design-history publications (particularly the 2003 anniversary book and the 140th anniversary site) which made much of this genealogy verifiable.
