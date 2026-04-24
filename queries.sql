-- ============================================================
-- FAA Wildlife Strike Analysis · 1990–2025
-- Author: John Miguel Molina (@cloudrosemage)
-- Database: SQLite (wildlife.db)
-- Table: strikes
-- Source: FAA National Wildlife Strike Database
--         https://wildlife.faa.gov
-- ============================================================


-- ============================================================
-- SECTION 1: EXPLORATION & DATA QUALITY CHECKS
-- Run these first to understand the dataset before analysis.
-- ============================================================

-- 1.1 Confirm total record count
SELECT COUNT(*) AS total_records
FROM strikes;

-- 1.2 Check year range coverage
SELECT
  MIN(INCIDENT_YEAR) AS earliest_year,
  MAX(INCIDENT_YEAR) AS latest_year,
  COUNT(DISTINCT INCIDENT_YEAR) AS years_covered
FROM strikes;

-- 1.3 Check for nulls in key analytical columns
SELECT
  COUNT(*)                                                        AS total_records,
  SUM(CASE WHEN PHASE_OF_FLIGHT    IS NULL THEN 1 ELSE 0 END)   AS null_phase_of_flight,
  SUM(CASE WHEN DAMAGE_LEVEL       IS NULL THEN 1 ELSE 0 END)   AS null_damage_level,
  SUM(CASE WHEN SPECIES            IS NULL THEN 1 ELSE 0 END)   AS null_species,
  SUM(CASE WHEN STATE              IS NULL THEN 1 ELSE 0 END)   AS null_state,
  SUM(CASE WHEN AIRPORT            IS NULL THEN 1 ELSE 0 END)   AS null_airport,
  SUM(CASE WHEN COST_REPAIRS_INFL_ADJ IS NULL THEN 1 ELSE 0 END) AS null_repair_cost
FROM strikes;

-- 1.4 See all distinct flight phases
SELECT DISTINCT PHASE_OF_FLIGHT
FROM strikes
ORDER BY PHASE_OF_FLIGHT;

-- 1.5 See all distinct damage level codes
-- N = None, M = Minor, S = Substantial, D = Destroyed
SELECT DISTINCT DAMAGE_LEVEL
FROM strikes
ORDER BY DAMAGE_LEVEL;

-- 1.6 Strike volume by year (quick overview)
SELECT
  INCIDENT_YEAR,
  COUNT(*) AS strikes
FROM strikes
GROUP BY INCIDENT_YEAR
ORDER BY INCIDENT_YEAR;


-- ============================================================
-- SECTION 2: ANALYSIS QUERY 1 — STRIKES BY AIRPORT
-- Answers: Which airports have the highest wildlife strike
-- frequency, and how many of those strikes caused damage?
-- Exported as: airports.csv
-- ============================================================

SELECT
  AIRPORT,
  STATE,
  LATITUDE,
  LONGITUDE,
  COUNT(*) AS total_strikes,
  SUM(CASE WHEN DAMAGE_LEVEL NOT IN ('N', '') AND DAMAGE_LEVEL IS NOT NULL
      THEN 1 ELSE 0 END) AS damaging_strikes
FROM strikes
WHERE AIRPORT IS NOT NULL
GROUP BY AIRPORT, STATE, LATITUDE, LONGITUDE
ORDER BY total_strikes DESC
LIMIT 30;


-- ============================================================
-- SECTION 3: ANALYSIS QUERY 2 — PHASE OF FLIGHT VS DAMAGE
-- Answers: During which phase of flight do the most strikes
-- occur, and how severe is the damage at each phase?
-- Exported as: phases.csv
-- ============================================================

SELECT
  PHASE_OF_FLIGHT,
  COUNT(*)                                                      AS total_strikes,
  SUM(CASE WHEN DAMAGE_LEVEL = 'M' THEN 1 ELSE 0 END)         AS minor,
  SUM(CASE WHEN DAMAGE_LEVEL = 'S' THEN 1 ELSE 0 END)         AS substantial,
  SUM(CASE WHEN DAMAGE_LEVEL = 'D' THEN 1 ELSE 0 END)         AS destroyed
FROM strikes
WHERE PHASE_OF_FLIGHT IS NOT NULL
GROUP BY PHASE_OF_FLIGHT
ORDER BY total_strikes DESC;


-- ============================================================
-- SECTION 4: ANALYSIS QUERY 3 — ANNUAL TREND & REPAIR COSTS
-- Answers: How has strike volume grown over 35 years, and
-- what is the corresponding inflation-adjusted repair cost?
-- Uses COST_REPAIRS_INFL_ADJ for fair year-to-year comparison.
-- Exported as: yearly_trend.csv
-- ============================================================

SELECT
  INCIDENT_YEAR,
  COUNT(*)                        AS total_strikes,
  SUM(COST_REPAIRS_INFL_ADJ)     AS total_repair_cost
FROM strikes
WHERE INCIDENT_YEAR BETWEEN 1990 AND 2025
GROUP BY INCIDENT_YEAR
ORDER BY INCIDENT_YEAR;


-- ============================================================
-- SECTION 5: BONUS QUERIES
-- Additional angles not included in the dashboard but useful
-- for deeper analysis or future iterations.
-- ============================================================

-- 5.1 Top 10 wildlife species involved in strikes
SELECT
  SPECIES,
  COUNT(*) AS total_strikes,
  SUM(CASE WHEN DAMAGE_LEVEL NOT IN ('N', '') AND DAMAGE_LEVEL IS NOT NULL
      THEN 1 ELSE 0 END) AS damaging_strikes
FROM strikes
WHERE SPECIES IS NOT NULL AND SPECIES != 'Unknown bird or bat'
GROUP BY SPECIES
ORDER BY total_strikes DESC
LIMIT 10;

-- 5.2 Strikes by time of day
SELECT
  TIME_OF_DAY,
  COUNT(*) AS total_strikes
FROM strikes
WHERE TIME_OF_DAY IS NOT NULL
GROUP BY TIME_OF_DAY
ORDER BY total_strikes DESC;

-- 5.3 States with highest strike counts
SELECT
  STATE,
  COUNT(*) AS total_strikes
FROM strikes
WHERE STATE IS NOT NULL
GROUP BY STATE
ORDER BY total_strikes DESC
LIMIT 15;

-- 5.4 Most expensive single strike incidents (inflation-adjusted)
SELECT
  INCIDENT_YEAR,
  AIRPORT,
  STATE,
  SPECIES,
  PHASE_OF_FLIGHT,
  DAMAGE_LEVEL,
  COST_REPAIRS_INFL_ADJ
FROM strikes
WHERE COST_REPAIRS_INFL_ADJ IS NOT NULL
ORDER BY COST_REPAIRS_INFL_ADJ DESC
LIMIT 10;

-- 5.5 Strikes involving engine ingestion (highest risk category)
SELECT
  INCIDENT_YEAR,
  COUNT(*) AS engine_ingestion_strikes
FROM strikes
WHERE INGESTED = 1
GROUP BY INCIDENT_YEAR
ORDER BY INCIDENT_YEAR;
