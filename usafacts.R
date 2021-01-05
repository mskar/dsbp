library(tidyverse)

# Read in usafacts data, pivot_longer (aka melt or gather), fix dates 
df <- readr::read_csv(
  "https://static.usafacts.org/public/data/covid-19/covid_confirmed_usafacts.csv"
  ) %>% 
  pivot_longer(
    -colnames(df)[1:4],
    names_to = "date",
    values_to = "case"
    ) %>%
  separate(
    date,
    sep="/",
    into = c("month", "day", "year")
  ) %>%
  mutate(month = str_pad(month, width=2, pad = 0)) %>% 
  mutate(year = paste0("20", year)) %>% 
  unite(iso_date, year, month, day, sep = "-", remove = FALSE)

# Read in a local file
download.file(
  "https://static.usafacts.org/public/data/covid-19/covid_confirmed_usafacts.csv",
  "usafacts_cases.csv"
  )