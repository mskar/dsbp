url <- "https://static.usafacts.org/public/data/covid-19/covid_confirmed_usafacts.csv"
fname <- paste(Sys.Date(), "usafacts_cases.csv", sep = "_")
csv_file <- paste("data", fname, sep = "/")
rds_file <- gsub(".csv$", ".rds", csv_file)
download.file(url, fname)

df <- read.csv(csv_file)

saveRDS(df, rds_file)

df <- readRDS(rds_file)
