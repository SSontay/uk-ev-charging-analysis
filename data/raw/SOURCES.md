# Raw data sources

All files were downloaded on 27 October 2026 (the census table on 28 October 2026) and are kept here unchanged. They are published under the Open Government Licence v3.0.

| File | Description | Publisher | Source page |
| --- | --- | --- | --- |
| `veh0105.ods` | Licensed vehicles at quarter end by body type, fuel type, keepership and local authority (GB and UK) | Department for Transport | [Vehicle licensing statistics data tables](https://www.gov.uk/government/statistical-data-sets/vehicle-licensing-statistics-data-tables) (updated 23 Sep 2026) |
| `veh0142.ods` | Licensed plug-in vehicles at quarter end by body type, fuel type, keepership and local authority (UK) | Department for Transport | same as above |
| `veh1153.ods` | Vehicles registered for the first time by body type, fuel type and keepership (GB and UK) | Department for Transport | same as above |
| `evci0102_2026-07_EV_chargers_by_local_authority_UK.ods` | Public EV chargers by local authority, UK, 1 July 2026 | Department for Transport | [EV charging infrastructure statistics data tables (EVCI)](https://www.gov.uk/government/statistical-data-sets/electric-vehicle-charging-infrastructure-statistics-data-tables-evci) (published 27 Aug 2026) |
| `evci9001_2026-07_EV_charging_devices_UK.ods` | Public EV charging devices, historic series, UK | Department for Transport | same as above |
| `File_10_IoD2025_Local_Authority_District_Summaries_lower-tier_v2.xlsx` | English Indices of Deprivation 2025, local authority district summaries (lower tier, v2). England only | Ministry of Housing, Communities and Local Government | [English indices of deprivation 2025](https://www.gov.uk/government/statistics/english-indices-of-deprivation-2025) |
| `ons_gdhi_local_authorities_1997to2024.xlsx` | Regional gross disposable household income (GDHI) by local authority, 1997 to 2024 | Office for National Statistics | [Regional GDHI: local authorities](https://www.ons.gov.uk/economy/regionalaccounts/grossdisposablehouseholdincome/datasets/regionalgrossdisposablehouseholdincomelocalauthorities) (released 19 Aug 2026) |
| `census2021-ts044-ltla.csv` | Census 2021 table TS044: households by accommodation type, lower-tier local authorities (2021 boundaries). England and Wales only. Downloaded on 28 October 2026 | Office for National Statistics | [Nomis Census 2021 bulk data](https://www.nomisweb.co.uk/sources/census_2021_bulk) (file `census2021-ts044.zip`) |

## Notes

- The deprivation indices cover England only. Scotland, Wales and Northern Ireland publish their own indices, and these are not comparable with England's.
- Local authority boundaries change over time. Area codes (ONS GSS codes, e.g. `E09000026`) are used to join the tables, not area names.
- Census 2021 uses 2021 local authority boundaries. Districts merged in 2023 (Cumbria, North Yorkshire, Somerset) are summed into the new codes in notebook 02.
