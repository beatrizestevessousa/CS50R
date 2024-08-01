load("zelda.RData")

zelda <- zelda %>%
  arrange(year, system) %>%
  group_by(title) %>%
  filter(year == min(year)) %>%
  ungroup() %>%
  arrange(year, title, system)

save(zelda, file = "3.RData")
