# Missoula County Cadastral Cleaning (Remove Public Entities)

This repository contains an R script that loads the Missoula County cadastral dataset, summarizes land ownership by `OwnerName`, and removes public/government/tribal entities (plus `UNKNOWN_OWNER`) so you can focus analyses on non-public owners (e.g., top landowners by acres).

## What this script does

Using `Missoula_county.R`, the workflow:

1. Reads the cadastral Excel file:
   - `MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls`
2. Groups records by `OwnerName`
3. Calculates summary metrics such as:
   - `parcel_count` = number of parcels per owner
   - `GISAcres` = total acres per owner (summed)
4. Removes:
   - missing/blank `OwnerName` values (in the “clean” pipeline)
   - `UNKNOWN_OWNER`
   - a defined list of public entities (federal/state/county/city agencies, tribes, etc.)
5. Sorts owners by total acres and prints the **top 25** owners by `GISAcres`.

## Repository structure

Recommended structure:

## Requirements

### R packages
The script uses:

- `tidyverse`
- `readxl`
- `dplyr` (via tidyverse)
- `stringr` (via tidyverse)

Install if needed:

```r
install.packages(c("tidyverse", "readxl"))
