flavor <- readline("Flavor: ")
caffeine <- readline("Caffeine: ")

if (flavor == "Light" && caffeine == "Yes") {
  cat("You might like green tea 🫖 ")
} else if (flavor == "Light" && caffeine == "No") {
  cat("You might like chamomile tea 🫖")
} else if (flavor == "Bold" && caffeine == "Yes") {
  cat("You might like black tea 🫖")
} else{
  cat("You might like rooibos tea 🫖")
}
