#' @title Cats in R console.
#' @name kittyR
#' @author \href{https://github.com/IndrajeetPatil/}{Indrajeet Patil}
#' @return A photo of a cat is downloaded and displayed in the plot window.
#' @description This function displays a picture of a cat and plays a short
#'   sound clip containing cat meow.
#' Currently, the images are collected from the following sources-
#' \enumerate{
#' \item \url{https://pixabay.com/en/photos/cat/}
#' \item \url{https://www.pexels.com/search/cat/}
#' }
#' The sound files come from the following CC BY 3.0 source:
#' \url{http://soundbible.com/suggest.php?q=cat+meow&x=0&y=0}
#'
#' @param url URL for the source from which individual image URLs are to be
#'   extracted. Default is `NULL`. If `NULL`, a randomly drawn image from the
#'   default collection will be shown.
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
#' # relying on default collection
#' set.seed(3444)
#' kittyR::kittyR(meow = FALSE)
#'
#' # proving a custom URL
#' kittyR::kittyR(
#'   url = "https://www.pexels.com/search/cat/",
#'   meow = FALSE
#' )
#' @export

# function body
kittyR <- function(url = NULL, meow = TRUE, sound = 3) {
  if (is.null(url)) {
    # getting the dataframe with image URLs
    df_combined <-
      purrr::pmap_dfr(
        .l = list(url = tibble::lst(
          "https://pixabay.com/en/photos/cat/",
          "https://www.pexels.com/search/cat/"
        )),
        .f = kittyR::kitty_pics_df,
        .id = "source"
      )
  } else {
    df_combined <- kittyR::kitty_pics_df(url = url)
  }

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

  # display the cat
  graphics::plot(kitty, yaxt = "n", axes = FALSE)

  # if needed, play a meow sound
  if (isTRUE(meow)) {
    kittyR::meowR(sound = sound)
  }

}
