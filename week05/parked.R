library("readr")
library("tidyverse")
library("stringr")

file <- read_file("lyrics/robinson.txt")

lyrics <- file %>%
  tolower() %>%
  str_remove_all("'s") %>%
  str_remove_all("'ll") %>%
  str_remove_all("'m") %>%
  str_remove_all("'ve") %>%
  str_replace_all("\n", " ")

lyrics <- gsub("[[:punct:]]", "", lyrics)

words <- unlist(str_split(lyrics, " "))
words <- words[words != ""]

df <- data.frame(
  word = unique(words),
  count = as.integer(table(words))
)

df <- df %>% filter(count > 1)

plot <- ggplot(df, aes(x = word, y = count)) +
  geom_col()

ggsave("lyrics.png", plot = plot, width = 10, height = 6)
