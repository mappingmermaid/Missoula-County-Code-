library(tidyverse)
library(readxl)
Missoula_County_Cadastral_OG <- 
  read_excel("MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls")

data = Missoula_County_Cadastral_OG$OwnerName
#data = data.frame[,5]
#data = c('a','b','c','a','a','b','a','b')

unique_owners = unique(data)
unique_owners[130]

n = length(unique_owners)

results = numeric(n)


for (i in 1:n){
  records = which(unique_owners[i] == data, arr.ind=TRUE)
  results[i] = length(records)
}
##############################

which(results==9,arr.ind=TRUE)
unique(Missoula_County_Cadastral_OG$OwnerName[which(results==10,arr.ind=TRUE)])

#unique_owners[62]

properties_indx = which(unique_owners[which(results==53,arr.ind=TRUE)] == Missoula_County_Cadastral_OG$OwnerName)

sum(Missoula_County_Cadastral_OG$GISAcres[properties_indx])

which(Missoula_County_Cadastral_OG$OwnerName=='RUNNING PETER',arr.ind=TRUE)

table(data)

readxl::read_excel("MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls") |>
  dplyr::group_by(OwnerName) |>
  dplyr::summarise(
    parcel_count = dplyr::n(),
    GISAcres = sum(GISAcres),
    .groups = "drop"
  ) |>
    dplyr::arrange(dplyr::desc(GISAcres)) |>
    dplyr::filter(!(OwnerName %in% c(
      "UNITED STATES OF AMERICA",
      "CONFEDERATED SALISH & KOOTENAI TRIBES",
      "STATE OF MONTANA",
      "MONTANA DEPT OF FISH WILDLIFE & PARKS",
      "STATE OF MONTANA STATE BOARD OF LAND COMMISSIONERS",
      "UNITED STATES BUREAU OF LAND MANAGEMENT",
      "UNITED STATES FOREST SERVICE",
      "MONTANA DEPT OF NATURAL RESOURCES & CONSERVATION",
      "CITY OF MISSOULA",
      "BUREAU OF LAND MANAGEMENT",
      "UNITED STATES BUREAU OF LAND MANAGEMENT GARNET AREA",
      "DEPARTMENT OF FISH WILDLIFE & PARKS",
      "MISSOULA COUNTY AIRPORT AUTHORITY",
      "MISSOULA COUNTY"
    ))) |>
    head(25) |>
    print(n = 25)

readxl::read_excel("MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls") |>
  dplyr::filter(is.na(OwnerName) | OwnerName == "") |>
  dplyr::summarise(
    total_parcels = dplyr::n(),
    total_acres = sum(GISAcres, na.rm = TRUE),
    mean_acres = mean(GISAcres, na.rm = TRUE),
    median_acres = median(GISAcres, na.rm = TRUE),
    max_acres = max(GISAcres, na.rm = TRUE)
  )

readxl::read_excel("MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls") |>
  dplyr::group_by(OwnerName) |>
  dplyr::summarise(
    parcel_count = dplyr::n(),
    GISAcres = sum(GISAcres, na.rm = TRUE),
    .groups = "drop"
  ) |>
  dplyr::filter(
    OwnerName != "UNKNOWN_OWNER",
    !(OwnerName %in% c(
      "UNITED STATES OF AMERICA",
      "CONFEDERATED SALISH & KOOTENAI TRIBES",
      "STATE OF MONTANA",
      "MONTANA DEPT OF FISH WILDLIFE & PARKS",
      "STATE OF MONTANA STATE BOARD OF LAND COMMISSIONERS",
      "UNITED STATES BUREAU OF LAND MANAGEMENT",
      "UNITED STATES FOREST SERVICE",
      "MONTANA DEPT OF NATURAL RESOURCES & CONSERVATION",
      "CITY OF MISSOULA",
      "BUREAU OF LAND MANAGEMENT",
      "UNITED STATES BUREAU OF LAND MANAGEMENT GARNET AREA",
      "DEPARTMENT OF FISH WILDLIFE & PARKS",
      "MISSOULA COUNTY AIRPORT AUTHORITY"
    ))
  ) |>
  dplyr::arrange(dplyr::desc(GISAcres)) |>
  head(25)

readxl::read_excel("MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls") |>
  dplyr::filter(is.na(OwnerName)) |>
  dplyr::select(OwnerName, OwnerAddre, GISAcres)

readxl::read_excel("MissoulaCountyCadastral/Missoula_County_Cadastral_OG.xls") |>
  dplyr::mutate(OwnerName = stringr::str_trim(OwnerName)) |>
  dplyr::filter(!is.na(OwnerName), OwnerName != "") |>
  dplyr::group_by(OwnerName) |>
  dplyr::summarise(
    parcel_count = dplyr::n(),
    GISAcres = sum(GISAcres, na.rm = TRUE),
    .groups = "drop"
  ) |>
  dplyr::filter(!(OwnerName %in% c(
    "UNITED STATES OF AMERICA",
    "CONFEDERATED SALISH & KOOTENAI TRIBES",
    "STATE OF MONTANA",
    "MONTANA DEPT OF FISH WILDLIFE & PARKS",
    "STATE OF MONTANA STATE BOARD OF LAND COMMISSIONERS",
    "UNITED STATES BUREAU OF LAND MANAGEMENT",
    "UNITED STATES FOREST SERVICE",
    "MONTANA DEPT OF NATURAL RESOURCES & CONSERVATION",
    "CITY OF MISSOULA",
    "BUREAU OF LAND MANAGEMENT",
    "UNITED STATES BUREAU OF LAND MANAGEMENT GARNET AREA",
    "DEPARTMENT OF FISH WILDLIFE & PARKS",
    "MISSOULA COUNTY AIRPORT AUTHORITY"
  ))) |>
  dplyr::arrange(dplyr::desc(GISAcres)) |>
  head(25)
