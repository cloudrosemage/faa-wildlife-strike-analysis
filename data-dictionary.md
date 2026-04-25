# FAA Wildlife Strike Database — Data Dictionary
## Key Column Reference for cloudrosemage/faa-wildlife-strike-analysis

Source: FAA National Wildlife Strike Database (wildlife.faa.gov)
Total columns in full dataset: 102
This dictionary covers the most analytically relevant fields used in this project,
plus additional columns of interest for future research.

---

## SECTION 1: RECORD IDENTIFICATION

| Column | Type | Description |
|---|---|---|
| `INDEX_NR` | Integer | Unique record identifier assigned by the FAA for each strike report |
| `INCIDENT_DATE` | Date | Full date of the strike incident (YYYY-MM-DD) |
| `INCIDENT_MONTH` | Integer | Month of the strike (1–12) |
| `INCIDENT_YEAR` | Integer | Year of the strike (1990–present) |
| `TIME` | Text | Local time of the strike in HHMM format (e.g., 1430 = 2:30 PM) |
| `TIME_OF_DAY` | Text | Categorical time of day: Day, Night, Dusk, Dawn |

---

## SECTION 2: LOCATION

| Column | Type | Description |
|---|---|---|
| `AIRPORT` | Text | Name of the airport where the strike occurred |
| `AIRPORT_ID` | Text | FAA airport identifier code (e.g., DEN, DFW, ORD) |
| `STATE` | Text | US state abbreviation where the airport is located |
| `FAAREGION` | Text | FAA regional office jurisdiction (e.g., AWP, AEA, ACE) |
| `LATITUDE` | Decimal | Geographic latitude of the airport — used for map visualization |
| `LONGITUDE` | Decimal | Geographic longitude of the airport — used for map visualization |
| `LOCATION` | Text | Freeform location description (city, area, or facility name) |

---

## SECTION 3: FLIGHT INFORMATION

| Column | Type | Description |
|---|---|---|
| `OPERATOR` | Text | Airline or operator name (e.g., SOUTHWEST AIRLINES, UNITED AIR LINES) |
| `OPID` | Text | FAA operator identifier code |
| `AIRCRAFT` | Text | Aircraft make and model (e.g., B-737, A-320) |
| `AMA` | Text | Aircraft make — manufacturer name only |
| `AMO` | Text | Aircraft model only |
| `EMA` | Text | Engine make |
| `EMO` | Text | Engine model |
| `AC_CLASS` | Text | Aircraft class: A = Airplane, B = Helicopter, C = Glider, etc. |
| `AC_MASS` | Integer | Aircraft mass category (1–5, where 5 = over 27,000 kg) |
| `TYPE_ENG` | Text | Engine type: A = Piston, B = Turbojet, C = Turboprop, D = Turbofan, E = None |
| `NUM_ENGS` | Integer | Number of engines on the aircraft |
| `PHASE_OF_FLIGHT` | Text | Phase of flight when strike occurred — see Phase of Flight Reference below |
| `HEIGHT` | Integer | Altitude of the strike above ground level (feet) |
| `SPEED` | Integer | Aircraft indicated airspeed at time of strike (knots) |
| `DIST_FROM_ARPT` | Integer | Distance from the airport at time of strike (nautical miles) |
| `FLT_PHASE` | Text | Abbreviated flight phase code |

---

## SECTION 4: WILDLIFE INFORMATION

| Column | Type | Description |
|---|---|---|
| `SPECIES` | Text | Common name of the wildlife species involved (e.g., Canada goose, European starling) |
| `SPECIES_ID` | Text | Smithsonian species identifier code |
| `SIZE` | Text | Size category of the wildlife: S = Small, M = Medium, L = Large |
| `NUM_SEEN` | Text | Number of animals seen by crew: 1, 2–10, 11–100, Over 100 |
| `NUM_STRUCK` | Text | Number of animals struck: 1, 2–10, 11–100, Over 100 |
| `BIRD_BAND_NUMBER` | Text | Bird band number if the struck bird was banded by wildlife agencies |
| `INGESTED` | Integer | Whether wildlife was ingested into an engine: 1 = Yes, 0 = No |

---

## SECTION 5: DAMAGE INFORMATION

| Column | Type | Description |
|---|---|---|
| `DAMAGE_LEVEL` | Text | Overall damage severity code — see Damage Level Reference below |
| `INDICATED_DAMAGE` | Integer | Whether any damage was indicated: 1 = Yes, 0 = No |
| `DAM_ENG1` | Integer | Engine 1 damaged: 1 = Yes, 0 = No |
| `DAM_ENG2` | Integer | Engine 2 damaged: 1 = Yes, 0 = No |
| `DAM_ENG3` | Integer | Engine 3 damaged: 1 = Yes, 0 = No |
| `DAM_ENG4` | Integer | Engine 4 damaged: 1 = Yes, 0 = No |
| `DAM_WINDSHLD` | Integer | Windshield damaged: 1 = Yes, 0 = No |
| `DAM_RADOME` | Integer | Radome damaged: 1 = Yes, 0 = No |
| `DAM_WING_ROT` | Integer | Wing or rotor damaged: 1 = Yes, 0 = No |
| `DAM_FUSE` | Integer | Fuselage damaged: 1 = Yes, 0 = No |
| `DAM_LG` | Integer | Landing gear damaged: 1 = Yes, 0 = No |
| `DAM_TAIL` | Integer | Tail damaged: 1 = Yes, 0 = No |
| `DAM_PROP` | Integer | Propeller damaged: 1 = Yes, 0 = No |
| `DAM_OTHER` | Integer | Other damage: 1 = Yes, 0 = No |
| `STRIKE_COMMENTS` | Text | Freeform narrative description of the strike incident |

---

## SECTION 6: SAFETY IMPACT

| Column | Type | Description |
|---|---|---|
| `EFFECT` | Text | Effect on flight: None, Aborted takeoff, Precautionary landing, Engine shutdown, Other |
| `EFFECT_OTHER` | Text | Freeform description if effect was categorized as Other |
| `SKY` | Text | Sky condition at time of strike: No Cloud, Some Cloud, Overcast |
| `PRECIP` | Text | Precipitation at time of strike: None, Rain, Fog, Snow |
| `NR_INJURIES` | Integer | Number of people injured as a result of the strike |
| `NR_FATALITIES` | Integer | Number of fatalities as a result of the strike |
| `WARNED` | Text | Whether wildlife personnel were warned before the flight: Y = Yes, N = No |

---

## SECTION 7: COST INFORMATION

| Column | Type | Description |
|---|---|---|
| `COST_REPAIRS` | Integer | Reported cost of aircraft repairs in nominal dollars at time of incident |
| `COST_OTHER` | Integer | Other costs associated with the strike (delays, inspections, etc.) in nominal dollars |
| `COST_REPAIRS_INFL_ADJ` | Integer | Repair costs adjusted for inflation to a common base year — use this column for year-to-year cost comparisons |
| `COST_OTHER_INFL_ADJ` | Integer | Other costs adjusted for inflation |
| `HOURS_OUT_OF_SERVICE` | Integer | Number of hours the aircraft was out of service due to the strike |

---

## SECTION 8: REPORTING INFORMATION

| Column | Type | Description |
|---|---|---|
| `REPORTER_NAME` | Text | Name of the person who submitted the strike report |
| `REPORTER_TITLE` | Text | Job title of the reporter (e.g., Pilot, Wildlife Biologist, Operations) |
| `SOURCE` | Text | Source of the report: Voluntary, MOR (Mandatory Occurrence Report), NTSB |
| `REMARKS` | Text | Additional freeform remarks from the reporter |
| `REG` | Text | Aircraft registration number (tail number) |

---

## REFERENCE TABLES

### Phase of Flight Reference

| Value | Description |
|---|---|
| `Approach` | Aircraft on final approach to land — below 1,000 feet AGL, gear typically down |
| `Landing Roll` | Aircraft on the runway after touchdown, decelerating to taxi speed |
| `Take-off Run` | Aircraft accelerating on the runway prior to rotation |
| `Climb` | Aircraft climbing after departure, gear retracted |
| `En Route` | Aircraft in cruise flight between departure and destination |
| `Departure` | Aircraft leaving the airport area after takeoff |
| `Descent` | Aircraft descending toward the destination airport |
| `Local` | Aircraft conducting local flight operations (training, pattern work) |
| `Arrival` | Aircraft entering the airport area prior to approach |
| `Taxi` | Aircraft moving on the ground under its own power |
| `Parked` | Aircraft stationary on the ground, engines may or may not be running |
| `Unknown` | Phase of flight not recorded or not known |

---

### Damage Level Reference

| Code | Description |
|---|---|
| `N` | None — no damage to the aircraft |
| `M` | Minor — damage that does not require immediate repair before next flight |
| `M?` | Uncertain minor — damage reported but severity uncertain |
| `S` | Substantial — damage that significantly affects structural strength or flight characteristics |
| `D` | Destroyed — aircraft damage beyond economical repair |

---

### Aircraft Class Reference

| Code | Description |
|---|---|
| `A` | Airplane |
| `B` | Helicopter / Rotorcraft |
| `C` | Glider |
| `D` | Balloon |
| `F` | Ultralight |
| `I` | Unknown |
| `J` | Powered parachute |
| `Y` | Other |
| `Z` | Unknown |

---

### Engine Type Reference

| Code | Description |
|---|---|
| `A` | Reciprocating / Piston |
| `B` | Turbojet |
| `C` | Turboprop |
| `D` | Turbofan |
| `E` | None (glider or unpowered) |
| `F` | Turboshaft (helicopter) |
| `Y` | Other |
| `Z` | Unknown |

---

### FAA Region Reference

| Code | Region |
|---|---|
| `AAL` | Alaska |
| `ACE` | Central (Kansas City) |
| `AEA` | Eastern (New York) |
| `AGL` | Great Lakes (Chicago) |
| `ANE` | New England (Boston) |
| `ANM` | Northwest Mountain (Seattle) |
| `ASO` | Southern (Atlanta) |
| `ASW` | Southwest (Fort Worth) |
| `AWP` | Western Pacific (Los Angeles) |
| `FGN` | Foreign — strikes reported outside the US |

---

## NOTES ON DATA QUALITY

- **Voluntary reporting:** Strike reporting is not mandatory for most operators. The database represents reported incidents only — actual strike frequency is estimated to be significantly higher.
- **Null values:** Many fields contain null or blank values, particularly for older records (pre-2000) where reporting standards were less detailed. Key columns with high null rates include TIME, TIME_OF_DAY, SPECIES, HEIGHT, SPEED, and cost fields.
- **Cost fields:** Zero values in COST_REPAIRS and COST_OTHER may represent no damage or unreported costs — these cannot be distinguished without reviewing individual records.
- **Species identification:** Species names in older records rely on visual identification by crew or reporters. DNA-confirmed identifications from the Smithsonian Feather Identification Laboratory are more common in recent records.
- **Inflation adjustment:** Always use COST_REPAIRS_INFL_ADJ rather than COST_REPAIRS for year-to-year cost comparisons. The nominal cost field does not account for inflation and will understate the relative cost of older incidents.

---

*Prepared by John Miguel Co Molina · github.com/cloudrosemage · April 2026*
*Source: FAA National Wildlife Strike Database · wildlife.faa.gov*
