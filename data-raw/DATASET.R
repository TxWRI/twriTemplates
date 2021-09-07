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
