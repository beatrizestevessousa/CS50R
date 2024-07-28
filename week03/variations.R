random_character <- function() {
  # TODO: Return one random letter
  return (sample(x = letters, size = 1))
}

print_sequence <- function(length) {
  # TODO: Print a random sequence of specified length
  for (time in 1:length) {
    letter <- random_character()
    cat(letter)
    Sys.sleep(0.25)
  }
}

print_sequence(20)
