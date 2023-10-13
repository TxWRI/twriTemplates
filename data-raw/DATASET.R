## code to prepare `Dissolved_Oxygen` dataset goes here

library(dplyr)

Dissolved_Oxygen <- readr::read_delim(file = "https://raw.githubusercontent.com/mps9506/tbrf/master/data-raw/DO.txt", delim = "|" ) %>%
  mutate(`End Date` = as.Date(`End Date`, "%m/%d/%Y")) %>%
  group_by(`Station ID`, `End Date`, `Parameter Code`, `Parameter Description`) %>%
  summarise(Average_DO = mean(Value),
            Min_DO = min(Value),
            .groups = "drop") %>%
  rename(Station_ID = `Station ID`,
         Date = `End Date`,
         Param_Code = `Parameter Code`,
         Param_Desc = `Parameter Description`)

usethis::use_data(Dissolved_Oxygen, overwrite = TRUE)


## code to prepare `easterwood_weather` dataset goes here

easterwood_weather <- readr::read_csv(file = "data-raw/easterwood.csv",
                                      col_types = "cDcnn")

usethis::use_data(easterwood_weather, overwrite = TRUE)


## code to prepare `mission_aransas_nerr` dataset goes here

files <- c("data-raw/marabwq2020.csv",
           "data-raw/marabwq2021.csv",
           "data-raw/marcewq2020.csv",
           "data-raw/marcewq2021.csv")

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

neon_stage_discharge <- readr::read_rds("data-raw/neon.rds")
neon_stage_discharge <- neon_stage_discharge$dsc_fieldData

usethis::use_data(neon_stage_discharge, overwrite = TRUE)


## code to prepare `arroyo_wetland` data is here

arroyo_wetland <- readr::read_delim("data-raw/arroyo_swqm.txt",
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
