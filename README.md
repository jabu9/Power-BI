# Power BI Projects

A collection of Power BI work: *Makeover Monday* challenge reports and a library of reusable Power Query (M) tables you can drop into any model.

## What's here

### Makeover Monday
Reimagined takes on public datasets from the [Makeover Monday](https://makeovermonday.co.uk/) challenge.

| Project | Contents |
|---------|----------|
| [World Happiness Report](Makeover%20Monday/World%20Happiness%20Report) | Source data, Power Query M script, DAX ranking columns, report screenshots |
| [WK15](Makeover%20Monday/WK15%20TBD) | In progress |

### Reusable tables (`Tables/`)
Paste any of these into **Get Data → Blank Query → Advanced Editor**.

| Table | Use |
|-------|-----|
| `Date Table.m` | Calendar dimension for time intelligence |
| `Time Zones.m` | Time zone reference with offsets |
| `Geography Table.m` | Countries with ISO codes and continents |
| `Currency.m` | Currency codes, names and regions |
| `Unit Conversion.m` | Common unit conversion factors |
| `Color Reference.m` | Color names with hex and RGB values |
| `Error Log.m` | Function that builds a timestamped error log row (step + message) |

## Repository structure

```
Power-BI/
├── Makeover Monday/
│   ├── World Happiness Report/
│   │   ├── Data/       # Source .xlsx, M script, DAX notes
│   │   ├── Visuals/    # Report screenshots
│   │   └── README.md
│   └── WK15 TBD/
├── Tables/             # Reusable Power Query (M) tables
└── README.md
```

## Usage

1. Clone or download the repo.
2. Open the project's README for import steps (usually: load the source file, paste the M script into a blank query, update the file path).
3. Build visuals in Power BI Desktop, or compare against the screenshots in `Visuals/`.

Completed `.pbix` files aren't stored here; reach out if you'd like one.

## License

[MIT](LICENSE) © 2025 Jordan Abuhantash. Third-party source datasets (e.g. the World Happiness Report) remain under their original publishers' terms.
