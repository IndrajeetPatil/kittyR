#' @title Cats in R console.
#' @name kittyR
#' @author \href{https://github.com/IndrajeetPatil/}{Indrajeet Patil}
#' @return A photo of a cat is downloaded and displayed in the plot window.
#'
#' @param meow Logical that decides whether to play a meow sound along with the
#'   picture of a cat.
#' @inheritParams meowR
#'
#' @importFrom rvest html_session html_nodes html_attr
#' @importFrom imager load.image
#' @importFrom purrr map pmap_dfr
#' @importFrom tibble as_tibble enframe lst
#' @importFrom dplyr %>% mutate filter
#' @importFrom stringr str_split str_remove_all
#' @importFrom graphics plot
#'
#' @examples
#' kittyR::kittyR(meow = FALSE)
#' @export

# function body
kittyR <- function(meow = TRUE, sound = 3) {

  # getting the dataframe with image URLs
  df_combined <-
    purrr::pmap_dfr(
      .l = list(url = tibble::lst(
        "https://pixabay.com/en/photos/cat/",
        "https://www.pexels.com/search/cat/"
      )),
      .f = kittyR::kitty_pics_df, .id = "source"
    )

  # create a temporary dierctory
  temporary_file_location <- paste0(tempdir(), "/kitties.png")

  # download a random image
  utils::download.file(
    url = df_combined$url[sample(x = 1:length(df_combined$url), size = 1)],
    destfile = temporary_file_location,
    mode = "wb"
  )

  # bring the kitties to R
  kitty <- imager::load.image(temporary_file_location)

  # if needed, play a meow sound
  if (isTRUE(meow)) {
    kittyR::meowR(sound = sound)
  }

  # display the cat
  graphics::plot(kitty, yaxt = "n", axes = FALSE)
}
