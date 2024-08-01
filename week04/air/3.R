load("air.RData")

air <- air |>
  filter(county == "OR - Benton")

save(air, file="3.RData")
