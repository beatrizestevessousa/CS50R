load("air.RData")

air <- air|>
  group_by(county) %>%
  filter(emissions == max(emissions)) %>%
  ungroup()

save(air, file="5.RData")
