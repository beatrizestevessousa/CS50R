# Get data from CSV files
books <- read.csv("books.csv")
authors <- read.csv("authors.csv")

# Get the only Mia Morgan's book for the writer
writer_book <- which(books$author == "Mia Morgan")
cat(books$title[writer_book])

# Get a music book from 1613 for the musician
musician_book <- which((books$topic == "Music") & (books$year == 1613))
cat(books$title[musician_book])

# Get a book from 1775 of one of the desired authors  for the traveler
author_books <- books$author == "Lysandra Silverleaf" | books$author == "Elena Petrova"
traveler_book <- which(author_books & books$year == 1775)
cat(books$title[traveler_book])

# Get the painter's book
topic <- books$topic == "Art"
size <- 200 <= books$pages & books$pages <= 300
year <- books$year == 1990 | books$year == 1992
painter_book <- which(topic & size & year)
cat(books$title[painter_book])

# Get the scientist's book
scientist_book <- which(grepl("Quantum Mechanics", books$title))
cat(books$title[scientist_book])

# Get the teacher's book
author_name <- c(authors$author[which(authors$hometown == "Zenthia")])
author <- c(books$author) %in% author_name
year <- 1700 <= books$year & books$year < 1800
topic <- books$topic == "Education"
teacher_book <- which(year & topic & author)
cat(books$title[teacher_book])
