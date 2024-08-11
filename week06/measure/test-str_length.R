library(stringr)
library(testthat)

test_that("`str_length` calculates length", {
  # Test case: Normal strings
  expect_equal(str_length("hello"), 5)
  expect_equal(str_length("Bowser"), 6)
  expect_equal(str_length("Idk"), 3)
})


test_that("`str_length` calculates length of vectors", {
  # Test case: Vectors
  expect_equal(str_length(c("i", "like", "programming")), c(1, 4, 11))
  expect_equal(str_length(c("hello", "World")), c(5, 5))
})


test_that("`str_length` handles NA", {
  # Test case: NA values
  expect_equal(suppressWarnings(str_length(c("i", "like", "programming", NA))), c(1, 4, 11, NA))
  expect_equal(suppressWarnings(str_length(NA)), NA_integer_)
})


test_that("`str_length` calculates length with emoji and punctuation", {
  # Test case: whitespaces, punctuation and emojis
  expect_equal(str_length("hello!"), 6)
  expect_equal(str_length("Bowser 🦖"), 8)
  expect_equal(str_length("Idk..."), 6)
})
