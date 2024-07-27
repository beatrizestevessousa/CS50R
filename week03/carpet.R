calculate_growth_rate <- function(years, visitors) {
  # TODO: Calculate yearly growth of visitors
  return ((visitors[13] - visitors[1]) / (years[13] - years[1]))
}

predict_visitors <- function(years, visitors, year) {
  # TODO: Predict visitors in given year
  growth <- calculate_growth_rate(years, visitors)
  last_year <- years[13]
  predict <- visitors[13]
  while (last_year < year) {
    predict <- predict + growth
    last_year <- last_year + 1
  }
  return(predict)
}

visitors <- read.csv("visitors.csv")
year <- as.integer(readline("Year: "))
predicted_visitors <- predict_visitors(visitors$year, visitors$visitors, year)
cat(paste0(predicted_visitors, " million visitors\n"))
