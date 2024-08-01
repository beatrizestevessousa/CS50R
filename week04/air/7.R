load("air.RData")

air <- air %>%
  filter(level_1 %in% c("Industrial Processes", "Miscellaneous Area Sources", "Mobile Sources", "Natural Sources",
                        "Solvent Utilization", "Stationary Source Fuel Combustion",
                        "Storage and Transport", "Waste Disposal, Treatment, and Recovery")) %>%
  group_by(level_1, pollutant) %>%
  summarize(emissions = sum(emissions), .groups = 'drop') %>%
  rename(source = level_1) %>%
  arrange(source, pollutant)

save(air, file="7.RData")
