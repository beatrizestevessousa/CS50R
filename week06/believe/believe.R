# Generated with ChatGPT

check_schedule_conflicts <- function(events) {
  # Error Handling: Check if input is a list
  if (!is.list(events)) {
    stop("Input must be a list of events.")
  }

  # Initialize an empty vector to hold POSIXct times
  event_times <- vector("list", length(events))

  # Process each event
  for (i in seq_along(events)) {
    event <- events[[i]]

    # Error Handling: Check if each event is a list with two elements
    if (!is.list(event) || length(event) != 2) {
      stop("Each event must be a list containing exactly two elements: start_time and end_time.")
    }

    # Convert start_time and end_time to POSIXct
    start_time <- as.POSIXct(event[[1]], format="%Y-%m-%d %H:%M", tz="UTC")
    end_time <- as.POSIXct(event[[2]], format="%Y-%m-%d %H:%M", tz="UTC")

    # Error Handling: Check if conversion was successful
    if (is.na(start_time) || is.na(end_time)) {
      stop("Start time and end time must be in the format 'YYYY-MM-DD HH:MM'.")
    }

    # Error Handling: Check if start_time is before end_time
    if (start_time >= end_time) {
      stop("Start time must be before end time.")
    }

    # Store the times
    event_times[[i]] <- c(start_time, end_time)
  }

  # Check for overlaps
  for (i in 1:(length(event_times) - 1)) {
    for (j in (i + 1):length(event_times)) {
      if (event_times[[i]][2] > event_times[[j]][1] && event_times[[i]][1] < event_times[[j]][2]) {
        return("Some events overlap, you can't do all these events.")
      }
    }
  }

  # If no overlaps are found
  return("The events do not overlap, it is possible to do all.")
}
