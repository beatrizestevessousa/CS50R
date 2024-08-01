load("air.RData")

air <- air |>
  arrange(desc(emissions))

save(air, file="2.RData")
