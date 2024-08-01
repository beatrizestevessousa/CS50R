air <- tibble(read.csv("air.csv"))

air <- dplyr::select(
  air,
  !c(ends_with("Type"), ends_with('Code'), ends_with('Sector'), ends_with('Description'), ends_with('Region'), FIPS)
)

air <- air %>%
  rename(
    state = State,
    county = State.County,
    pollutant = POLLUTANT,
    emissions = Emissions..Tons.,
    level_1 = SCC.LEVEL.1,
    level_2 = SCC.LEVEL.2,
    level_3 = SCC.LEVEL.3,
    level_4 = SCC.LEVEL.4
  )

air$emissions <- gsub(",", "", air$emissions)

air <- air %>%
      mutate(emissions = as.numeric(emissions))

save(air, file="air.RData")
