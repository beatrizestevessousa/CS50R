load("zelda.RData")

zelda <- zelda %>%
  arrange(year, system) %>%
  group_by(title) %>%
  filter(year == min(year)) %>%
  ungroup() %>%
  arrange(year, title, system)

zelda <- zelda %>%
  filter(str_count(zelda$producers, ",") > 0)

save(zelda, file="5.RData")
