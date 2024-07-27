file <- read.csv(readline("What file do you want to use? "))

print(paste(
  nrow(file),
  min(file$time),
  max(file$time),
  sum(file$time)
  )
)
