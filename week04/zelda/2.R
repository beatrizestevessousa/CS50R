load("zelda.RData")

zelda <- zelda %>%
  group_by(year) %>%
  summarize(releases = n()) %>%
  arrange(desc(releases))

save(zelda, file="2.RData")
