read_files <- function(filename) {
  return (read.csv(paste0(filename, ".csv")))
}


country <-readline("Country: ")
for (year in 2020:2024) {
  file <- read_files(year)
  if (country %in% unique(file$country)) {
    data <- file[which(file$country == country),]
    score <- apply(data[, -1], MARGIN = 1, FUN = sum)
    print(paste0(country, "(", year, "):", round(score, 2)))
  } else {
    print(paste0(country, "(", year, "): data unavailable"))
  }
}
