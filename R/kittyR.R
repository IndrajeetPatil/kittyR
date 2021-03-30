#' @title Cats in R console.
#' @name kittyR
#'
#' @return A photo of a cat is downloaded and displayed in the plot window.
#'
#' @description
#'
#' \Sexpr[results=rd, stage=render]{rlang:::lifecycle("stable")}
#'
#' This function displays a picture of a cat and plays a short sound clip
#' containing cat meow. It is possible that once in a while you might get a
#' picture that is in no way feline related. In such cases, just try again.
#'
#' Currently, the images are collected from the following sources-
#' \enumerate{
#' \item \url{https://unsplash.com/s/photos/cat/}
#' \item \url{https://www.reshot.com/search/cat/}
#' \item \url{https://unsplash.com/s/photos/kitten/}
#' \item \url{https://www.reshot.com/search/kitten/}
#' }
#'
#' The sound files come from the following CC BY 3.0 source:
#' \url{https://soundbible.com/}
#'
#' @param url URL for the source from which individual image URLs are to be
#'   extracted. Default is `NULL`. If `NULL`, a randomly drawn image from the
#'   default collection will be shown.
#' @param meow Logical that decides whether to play a meow sound along with the
#'   picture of a cat.
#' @param only_kitten Logical that decides whether only kitten pics should be
#'   selected (default: `FALSE`).
#' @inheritParams meowR
#' @param ... Additional arguments (currently ignored).
#'
#' @importFrom rvest session html_nodes html_attr
#' @importFrom imager load.image
#' @importFrom purrr map pmap_dfr
#' @importFrom tibble as_tibble enframe lst
#' @importFrom dplyr %>% mutate filter
#' @importFrom stringr str_split str_remove_all
#' @importFrom graphics plot
#'
#' @examples
#' \donttest{
#' library(kittyR)
#'
#' # relying on default collection
#' set.seed(122)
#' kittyR(meow = FALSE)
#'
#' # in case you want only pics of kittens
#' set.seed(111)
#' kittyR(meow = FALSE, only_kitten = TRUE)
#'
#' # provide a custom URL
#' set.seed(300)
#' kittyR(
#'   url = "https://unsplash.com/s/photos/cat/",
#'   meow = FALSE
#' )
#' }
#' @export

# function body
kittyR <- function(url = NULL,
                   meow = TRUE,
                   sound = 3,
                   only_kitten = FALSE,
                   ...) {

  # if no url is provided
  if (is.null(url)) {
    # if only kitten pics are needed
    if (isTRUE(only_kitten)) {
      url_list <- list(url = tibble::lst(
        "https://unsplash.com/s/photos/kitten/",
        "https://www.reshot.com/search/kitten/"
      ))
    } else {
      url_list <- list(url = tibble::lst(
        "https://unsplash.com/s/photos/cat/",
        "https://www.reshot.com/search/cat/",
        "https://unsplash.com/s/photos/kitten/",
        "https://www.reshot.com/search/kitten/",
      ))
    }

    # getting the dataframe with image URLs
    df_combined <-
      purrr::pmap_dfr(
        .l = url_list,
        .f = kittyR::kitty_pics_df,
        .id = "source"
      )
  } else {
    df_combined <- kitty_pics_df(url)
  }

  # create a temporary directory
  temporary_file_location <- paste0(tempdir(), "/kitties.png")

  # download a random image
  utils::download.file(
    url = df_combined$url[sample(x = 1:length(df_combined$url), size = 1)],
    destfile = temporary_file_location,
    mode = "wb"
  )

  # bring the kitties to R
  kitty <- imager::load.image(file = temporary_file_location)

  # display the cat
  graphics::plot(kitty, yaxt = "n", axes = FALSE)

  # if needed, play a meow sound
  if (isTRUE(meow)) kittyR::meowR(sound = sound)
}
