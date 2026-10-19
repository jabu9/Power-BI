# Makeover Monday: World Happiness Report

This project reimagines the *World Happiness Report* dataset for the *Makeover Monday* challenge using Power BI. The repository provides tools and instructions to import, transform, and visualize the data.

## Getting Started

### Data Import
1. **Source File**: Use the provided `Source Data.xlsx` as the primary dataset.
2. **Power Query Setup**:
   - Open Power BI Desktop and navigate to "Get Data" > "Blank Query."
   - In the Advanced Editor, paste the M code from `Source Data.m` to import and transform `Source Data.xlsx` (Ensure you change the MCODE file path to where you saved 'Source Data.xlsx').
   - Apply the query to load the data into your model.

### Optional: Relational Tables
- To enhance filtering capabilities (e.g., by continent), import additional tables ([`Tables/`](../../Tables)) such as a country-to-continent mapping into Power Query.
- Create relationships between the `Source Data` table and these tables using the "Country name" column in the Power BI model view.

## Files
- **`Source Data.xlsx`**: The raw dataset for the World Happiness Report.
- **`Source Data.m`**: M code for importing and transforming the data in Power Query.
- **`.pbix` File**: The completed Power BI report is available on request (see Contact below).

## Usage Notes
- Ensure the file path in `Source Data.m` matches your local directory (e.g., update `"C:\Users\YourName\..."` as needed).
- Verify column names in the M code align with those in your `Source Data.xlsx` file.

## License
The M code, DAX and visuals in this folder are released under the repo's [MIT License](../../LICENSE) © 2025 Jordan Abuhantash. The underlying World Happiness Report data belongs to its original publishers.

## Contact
For questions, contributions, or to request the `.pbix` file, reach out via jordanabuhantashmedia@gmail.com or at https://www.jordanabuhantashmedia.com.