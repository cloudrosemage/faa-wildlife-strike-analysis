**FAA Wildlife Strike Analysis · 1990–2025**

An end-to-end data analytics project exploring 35 years of wildlife strike incidents reported to the Federal Aviation Administration. This project covers the full analytics workflow — from raw data acquisition and cross-reference verification, SQL-based exploration in JetBrains DataGrip, and interactive Power BI dashboard development, to professional stakeholder documentation across Notion, GitHub, and a Canva report.

**Overview**

Wildlife strikes — collisions between aircraft and birds or other animals — are one of aviation's most persistent and underappreciated safety challenges. Since 1990, the FAA has collected voluntary strike reports from airlines, airports, pilots, and air traffic controllers, building one of the most comprehensive aviation safety databases in the world.

This project analyzes 342,890 strike records across 713 US airports to answer three questions:
1. Which airports have the highest wildlife strike frequency?
2. During which phase of flight do the most dangerous strikes occur?
3. How have strike volume and associated repair costs trended over 35 years?

**Key Findings**

**Finding 1 — Denver International is the highest-risk airport in the United States**
With 11,538 recorded strikes between 1990 and 2025, Denver International leads all US airports by nearly 30% over the next highest airport, Dallas/Fort Worth International (8,889 strikes). Denver's position along the Central Flyway — one of North America's four major migratory bird corridors — combined with its high-elevation location, creates consistently elevated wildlife encounter rates. Notably, JFK ranks 4th in total strikes but records the highest damaging strike count among the top 5 airports, suggesting the large waterfowl population in the New York area presents a disproportionate damage risk relative to frequency.

**Finding 2 — Approach is the single most dangerous phase of flight**
88,268 strikes — 25.7% of all recorded incidents — occurred during approach, more than double the next highest phase, Landing Roll (37,578). Together, approach, landing roll, and take-off run account for nearly 75% of all strikes, confirming that proximity to ground level is the primary risk driver. While the approach produces the highest volume, the climb phase generates the highest rate of substantial and destroyed damage per strike, driven by engine ingestion events at high power settings.

**Finding 3 — Strike volume has tripled over 35 years with volatile repair costs**
Annual strike volume grew from approximately 2,000 incidents in 1990 to over 23,000 in 2024. Inflation-adjusted repair costs are highly volatile, peaking at approximately $95M in 2009 following the US Airways Flight 1549 incident — a single event that transformed industry awareness and drove a 40%+ spike in reporting rates. The long-term cost trend reflects a small number of high-severity engine ingestion events generating outsized economic impact relative to their frequency.

**Dashboard**

<img width="1443" height="836" alt="image" src="https://github.com/user-attachments/assets/bf5b898d-4525-426e-ab21-3e02829f2b17" />

<img width="1459" height="845" alt="image" src="https://github.com/user-attachments/assets/04bc9761-af3a-4138-95aa-0ed732481b91" />

<img width="1464" height="844" alt="image" src="https://github.com/user-attachments/assets/50c9d28b-2711-4c0d-af92-7aad0615548a" />

**Project Documentation**

- 📄 **Stakeholder Report** — [Full Canva PDF Report](https://canva.link/faaaviationwildlifeanalyticsreport)
- 📋 **Notion Process Documentation** — [Complete Step-by-Step Workflow](https://www.notion.so/Aviation-Wildlife-Strikes-An-Analysis-of-Wildlife-Strikes-Across-Airports-Throughout-the-United-Sta-34bcec93c31b80a59f6de90621fb6495?source=copy_link)
- 💾 **GitHub Repository** — [cloudrosemage/faa-wildlife-strike-analysis](https://github.com/cloudrosemage/faa-wildlife-strike-analysis)

**Tools & Workflow**

JetBrains DataGrip — SQL querying, data exploration, and aggregated CSV exports
SQLite — Local database engine storing and querying the full 342,890-row dataset
Microsoft Power BI Desktop — Interactive dashboard and data visualization
Microsoft Excel — Initial file inspection of the raw .xlsx download
CloudConvert — Independent XLSX to CSV conversion for cross-reference validation
Anthropic Claude — Data verification, CSV conversion cross-checking, and workflow guidance
Canva — Stakeholder report design and PDF creation
Notion — Full process documentation and write-up
GitHub — Version control and public project repository

**Data Source: FAA National Wildlife Strike Database**

Source: wildlife.faa.gov
Records: 342,890 strike reports
Date range: January 1990 – April 2026
Fields: 102 columns including airport, species, phase of flight, damage level, inflation-adjusted repair cost, and geographic coordinates
Note: Strike reporting is voluntary. The database represents reported incidents only. Actual strike frequency is estimated to be higher than recorded figures.

⚠️ The full source database (145MB XLSX / 182MB CSV) exceeds GitHub's file size limit and cannot be uploaded to this repository. The complete dataset is publicly available for free download at wildlife.faa.gov → Search the Database → Download Excel.

**SQL Queries**

All queries used in this project are documented in queries.sql, organized into five sections:
Section 1 — Data integrity and exploration checks
Section 2 — Airport strike frequency analysis (exported as airports.csv)
Section 3 — Phase of flight vs damage severity (exported as phases.csv)
Section 4 — Annual trend and inflation-adjusted repair costs (exported as yearly_trend.csv)
Section 5 — Bonus queries: species risk, time of day, state rankings, costliest incidents, engine ingestion

**Repository Structure**

faa-wildlife-strike-analysis/
│
├── data/
│   ├── airports.csv          # Strike counts by airport with lat/long (30 rows)
│   ├── phases.csv            # Strike counts by phase of flight (12 rows)
│   └── yearly_trend.csv      # Annual strikes and repair costs, 1990–2025 (36 rows)
│
├── screenshots/
│   ├── map.png               # Wildlife strikes by airport — bubble map
│   ├── bar-chart.png         # Strikes by phase of flight — bar chart
│   └── trend-line.png        # Annual strikes & repair costs — combo chart
│
├── queries.sql               # All DataGrip SQL queries used in this project
├── faa-wildlife-strikes.pbix # Power BI Desktop file
├── FAA Wildlife Strikes Visualization.pdf  # Static PDF export of dashboard
├── LICENSE
└── README.md

**Methodology Summary**

1. Acquired the full FAA Wildlife Strike Database from wildlife.faa.gov (342,890 records, 102 columns)
2. Verified data integrity via two independent CSV conversions — CloudConvert and Anthropic Claude — cross-referenced to confirm completeness
3. Imported the verified CSV into a SQLite database (wildlife.db) using JetBrains DataGrip
4. Explored the dataset with data integrity SQL queries (null checks, year range, distinct value review)
5. Analyzed using three targeted SQL queries, producing aggregated datasets for each analytical question
6. Exported pre-aggregated results as three clean CSVs for Power BI
7. Visualized using a bubble map, clustered bar chart, and dual-axis combo chart in Power BI Desktop
8. Published findings across a Canva stakeholder report, Notion process documentation, and this GitHub repository

**Limitations**

- Strike reporting is voluntary — actual frequency is higher than recorded figures across all years
- Reporting rates increased significantly post-2009; the upward trend partially reflects improved reporting behavior
- Repair cost data is incomplete for many records — zero values may represent unreported costs rather than no damage
- The UNKNOWN airport category (45,719 strikes) was excluded from geographic analysis due to missing location data
- Species identification accuracy varies — older records rely on visual identification rather than forensic DNA analysis

**About**

Built by John Miguel Co Molina (@cloudrosemage) as the first entry in a data analytics portfolio focused on aviation and aerospace data. Demonstrates end-to-end proficiency across data acquisition, verification, SQL-based exploration, interactive dashboard development, and professional stakeholder communication.

_Data current as of April 2026. The FAA Wildlife Strike Database is updated continuously as new reports are validated. All figures based on voluntarily reported strikes only._
