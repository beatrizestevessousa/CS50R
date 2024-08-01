load("air.RData")

air <- air|>
  filter(county == "OR - Benton")|>
  arrange(desc(emissions))

save(air, file="4.RData")
