library(testthat)
source("believe.R")


test_that("check_schedule_conflicts returns appropriate message for overlapping", {
  # Test case 1: Overlap
  events1 <- list(
    list("2024-08-09 09:00", "2024-08-09 10:00"),
    list("2024-08-09 09:30", "2024-08-09 11:00")
  )
  expect_equal(check_schedule_conflicts(events1), "Some events overlap, you can't do all these events.")

  # Test case 2: Another overlap
  events2 <- list(
    list("2024-08-09 09:00", "2024-08-09 10:00"),
    list("2024-08-09 10:00", "2024-08-09 11:00"),
    list("2024-08-09 09:30", "2024-08-09 10:30")
  )
  expect_equal(check_schedule_conflicts(events2), "Some events overlap, you can't do all these events.")
})

test_that("check_schedule_conflicts returns appropriate message for no overlapping", {
  # Test case: No overlap
  events1 <- list(
    list("2024-08-09 09:00", "2024-08-09 10:00"),
    list("2024-08-09 10:30", "2024-08-09 11:00")
  )
  expect_equal(check_schedule_conflicts(events1), "The events do not overlap, it is possible to do all.")
})

test_that("check_schedule_conflicts returns appropriate message for same time", {
  # Test case: All events start and end at the same time
  events1 <- list(
    list("2024-08-09 09:00", "2024-08-09 10:00"),
    list("2024-08-09 09:00", "2024-08-09 10:00")
  )
  expect_equal(check_schedule_conflicts(events1), "Some events overlap, you can't do all these events.")
})

test_that("check_schedule_conflicts warns errors", {
  # Test case: Missing event arguments
  event1 <- list(
    list("2024-08-09 09:00"),
    list("2024-08-09 09:00", "2024-08-09 10:00")
  )
  expect_error(check_schedule_conflicts(event1))

  # Test case: Not a list input
  expect_error(check_schedule_conflicts('HI'))
})
