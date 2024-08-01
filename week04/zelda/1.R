zelda <- read.csv("zelda.csv")

zelda$release <- gsub(" - ", "-", zelda$release)
zelda <- zelda %>%
  mutate(role = str_to_lower(role)) %>%
  mutate(release = strsplit(release, split="-")) %>%
  rename(system = release) %>%
  mutate(
    year = sapply(system, function(x) x[1]),
    system = sapply(system, function(x) x[2])
  )%>%
  mutate(year = as.numeric(year))


zelda <- pivot_wider(
  zelda,
  names_from = role,
  values_from = c(names))

save(zelda, file="zelda.RData")
