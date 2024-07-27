# Read data from CSV files
bus <- read.csv("bus.csv")
rail <- read.csv("rail.csv")

transports <- rbind(bus, rail)
routes <- unique(transports$route)
transports$percentage <- (transports$numerator / transports$denominator)*100

# Get user input
route <- readline("Route: ")

if (route %in% routes) {
 # Get on peak mean
  on_peak_transports <- transports$route == route & transports$peak == "PEAK"
  on_peak_transports <- transports$percentage[on_peak_transports]
  on_peak <- mean(on_peak_transports)
  cat(paste0("On time ", round(on_peak), "% of the time during peak hours."))
  off_peak_transports <- transports$route == route & transports$peak == "OFF_PEAK"
  off_peak_transports <- transports$percentage[off_peak_transports]
  off_peak <- mean(off_peak_transports)
  cat(paste0("\nOn time ", round(off_peak), "% of the time during off-peak hours."))
} else {
 cat("Invalid route")
}
