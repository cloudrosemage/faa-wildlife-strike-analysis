**FAA Wildlife Strike Analysis · 1990–2025**

An end-to-end data analytics project exploring 35 years of wildlife strike incidents reported to the Federal Aviation Administration. This project covers the full analytics workflow — from raw data acquisition and SQL-based exploration to interactive Power BI dashboards.

**Overview**

Wildlife strikes — collisions between aircraft and birds or other animals — are a significant aviation safety concern. The FAA has collected voluntary strike reports since 1990, building one of the most comprehensive aviation safety databases in the world.
This project analyzes 342,890 strike records across US airports to answer three questions:

1. Which airports have the highest wildlife strike frequency?
2. During which phase of flight do the most dangerous strikes occur?
3. How have strike volume and associated repair costs trended over 35 years?

**Key Findings**

- Approach is the riskiest phase of flight — 88,268 strikes occurred during approach, more than double the next highest phase (Landing Roll at 37,578). Aircraft are most vulnerable at low altitude with engines at high power.
- Denver International leads all US airports — with 11,538 recorded strikes, significantly ahead of Dallas/Fort Worth (8,889) and Chicago O'Hare (7,290), likely due to its location along major migratory bird corridors.
- Strike volume has tripled since 1990 — from ~2,000 strikes per year in the early 1990s to over 23,000 in 2024, driven by growing air traffic, wildlife population recovery, and improved reporting following the 2009 US Airways Flight 1549 incident.

**Data Source**

FAA National Wildlife Strike Database

- Source: wildlife.faa.gov
- Records: 342,890 strike reports
- Date range: 1990 – April 2026
- Fields: 102 columns, including airport, species, phase of flight, damage level, repair cost, and geographic coordinates
- Note: Strike reporting is voluntary. The database represents reported incidents only.

**SQL Queries**

The following queries were used to produce the three exported datasets. Full query file: queries.sql

Airport Strike Frequency

SELECT
  AIRPORT,
  STATE,
  LATITUDE,
  LONGITUDE,
  COUNT(*) AS total_strikes,
  SUM(CASE WHEN DAMAGE_LEVEL NOT IN ('N','') AND DAMAGE_LEVEL IS NOT NULL
      THEN 1 ELSE 0 END) AS damaging_strikes
FROM strikes
WHERE AIRPORT IS NOT NULL
GROUP BY AIRPORT, STATE, LATITUDE, LONGITUDE
ORDER BY total_strikes DESC
LIMIT 30;

Phase of Flight vs Damage

SELECT
  PHASE_OF_FLIGHT,
  COUNT(*) AS total_strikes,
  SUM(CASE WHEN DAMAGE_LEVEL = 'M' THEN 1 ELSE 0 END) AS minor,
  SUM(CASE WHEN DAMAGE_LEVEL = 'S' THEN 1 ELSE 0 END) AS substantial,
  SUM(CASE WHEN DAMAGE_LEVEL = 'D' THEN 1 ELSE 0 END) AS destroyed
FROM strikes
WHERE PHASE_OF_FLIGHT IS NOT NULL
GROUP BY PHASE_OF_FLIGHT
ORDER BY total_strikes DESC;

Annual Trend & Repair Costs

SELECT
  INCIDENT_YEAR,
  COUNT(*) AS total_strikes,
  SUM(COST_REPAIRS_INFL_ADJ) AS total_repair_cost
FROM strikes
WHERE INCIDENT_YEAR BETWEEN 1990 AND 2025
GROUP BY INCIDENT_YEAR
ORDER BY INCIDENT_YEAR;

**Repository Structure**

faa-wildlife-strike-analysis/
│
├── data/
│   ├── airports.csv          # Strike counts aggregated by airport (with lat/long)
│   ├── phases.csv            # Strike counts by phase of flight + damage breakdown
│   └── yearly_trend.csv      # Annual strike volume and inflation-adjusted repair costs
│
├── screenshots/
│   ├── map.png
│   ├── bar-chart.png
│   └── trend-line.png
│
├── queries.sql               # All DataGrip SQL queries used in this project
├── faa-wildlife-strikes.pbix # Power BI Desktop file
├── LICENSE
└── README.md

**About**

Built by John Miguel Molina (@cloudrosemage) as part of a data analytics portfolio focused on aviation and aerospace data.

This is the first project in a series exploring publicly available aviation safety datasets.

_Data is current as of April 2026. The FAA Wildlife Strike Database is updated continuously as new reports are validated._
