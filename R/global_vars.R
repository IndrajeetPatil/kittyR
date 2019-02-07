# defining global variables and functions to appease R CMD Check

utils::globalVariables(
  names = c(
    ".",
    "id"
  ),
  package = "catR",
  add = FALSE
)
