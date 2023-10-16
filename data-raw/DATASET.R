## code to prepare `dissolved_oxygen` dataset goes here

library(dplyr)
library(readr)

dissolved_oxygen_raw <- readr::read_delim(file = "https://raw.githubusercontent.com/mps9506/tbrf/master/data-raw/DO.txt", delim = "|" )

write_csv(dissolved_oxygen_raw, here::here("inst", "extdata", "dissolved_oxygen_raw.csv"))

dissolved_oxygen <- dissolved_oxygen_raw |>
  janitor::clean_names() |>
  mutate(end_date = as.Date(end_date, "%m/%d/%Y")) |>
  group_by(station_id, end_date, parameter_code, parameter_description) |>
  summarise(average_do = mean(value),
            min_do = min(value),
            .groups = "drop")

usethis::use_data(dissolved_oxygen, overwrite = TRUE)


## code to prepare `easterwood_weather` dataset goes here

easterwood_weather <- readr::read_csv(file = here::here("inst", "extdata", "easterwood.csv"),
                                      col_types = "cDcnn")

usethis::use_data(easterwood_weather, overwrite = TRUE)


## code to prepare `mission_aransas_nerr` dataset goes here

files <- c(here::here("inst", "extdata", "marabwq2021.csv"),
           here::here("inst", "extdata", "marcewq2021.csv"))

mission_aransas_nerr <- readr::read_csv(file = files,
                                 col_types = readr::cols_only(
                                   StationCode = readr::col_factor(),
                                   DateTimeStamp = readr::col_datetime(format = "%m/%e/%Y %H:%M"),
                                   Temp = readr::col_number(),
                                   F_Temp = readr::col_character(),
                                   SpCond = readr::col_number(),
                                   F_SpCond = readr::col_character(),
                                   Sal = readr::col_number(),
                                   F_Sal = readr::col_character(),
                                   DO_mgl = readr::col_number(),
                                   F_DO_mgl = readr::col_character()
                                 ))

usethis::use_data(mission_aransas_nerr, overwrite = TRUE)


## code to prepare `neon_stage_discharge` dataset goes here

neon_stage_discharge <- readr::read_rds(here::here("data-raw", "neon.rds"))
neon_stage_discharge <- neon_stage_discharge$dsc_fieldData

usethis::use_data(neon_stage_discharge, overwrite = TRUE)


## code to prepare `arroyo_wetland` data is here

arroyo_wetland <- readr::read_delim(here::here("inst", "extdata", "arroyo_swqm.txt"),
                                    delim = "|", escape_double = FALSE,
                                    col_types = readr::cols(`Segment ID` = readr::col_character(),
                                                            `Station ID` = readr::col_character(),
                                                            `End Date` = readr::col_date(format = "%m/%d/%Y"),
                                                            `End Time` = readr::col_time(format = "%H:%M"),
                                                            `Start Date` = readr::col_skip(),
                                                            `Start Time` = readr::col_skip(),
                                                            `Start Depth` = readr::col_skip(),
                                                            `Composite Category` = readr::col_skip(),
                                                            `Composite Type` = readr::col_skip(),
                                                            Comment = readr::col_skip(),
                                                            `Submitting Entity` = readr::col_skip(),
                                                            `Collecting Entity` = readr::col_skip(),
                                                            LOQ = readr::col_skip(),
                                                            `Data Qualifier` = readr::col_skip(),
                                                            `Verify Flag` = readr::col_skip(),
                                                            `Validation Flag` = readr::col_skip(),
                                                            `Rating Flag` = readr::col_skip(),
                                                            `Nelac Status` = readr::col_skip(),
                                                            `Exempt Status` = readr::col_skip()),
                                    comment = "##",
                                    trim_ws = TRUE) |>
  janitor::clean_names()

usethis::use_data(arroyo_wetland, overwrite = TRUE)


## for helsel and hirsch data

library(sbtools)
query_sb_doi('10.5066/P9JWL6XR')
item_list_children('5bf30260e4b045bfcae0c205')
item_list_files('5d5aa237e4b01d82ce8ecf3c')
item_file_download('5d5aa237e4b01d82ce8ecf3c',
                   names = "urantds2.csv",destinations = here::here("data-raw","urantds2.csv"))
uranium_tds <- readr::read_csv(here::here("data-raw","urantds2.csv")) |>
  janitor::clean_names() |>
  select(tds, uranium, hco3, definition)
usethis::use_data(uranium_tds, overwrite = TRUE)
