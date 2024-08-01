load("zelda.RData")

zelda <- zelda %>%
  arrange(year, system) %>%
  group_by(title) %>%
  filter(year == min(year),
         str_detect(producers, "Shigeru Miyamoto")) %>%
  ungroup() %>%
  arrange(year, title, system)

save(zelda, file="4.RData")
