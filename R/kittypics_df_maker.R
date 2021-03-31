#' @title Prepare a dataframe with URLs for cat pictures.
#' @name kitty_pics_df
#'
#' @description
#'
#' Mostly useful for internal workings of this package, this function extracts
#' images at given URL and returns it in a dataframe.
#'
#' @return A tibble containing extracted details from the provided URL.
#'
#' @param url URL for the source from which individual image URLs are to be
#'   extracted.
#' @param ... Currently ignored.
#'
#' @importFrom rvest session html_attr
#' @importFrom stringr str_split str_detect str_remove_all
#' @importFrom dplyr filter mutate bind_rows arrange row_number
#'
#' @examples
#' set.seed(123)
#' kittyR::kitty_pics_df("https://unsplash.com/s/photos/kitten/")
#' @export

# function body
kitty_pics_df <- function(url, ...) {
  # getting all cat images from webpage of interest
  kitties <-
    rvest::session(url) %>%
    rvest::html_nodes(css = "img")

  # exclusion pattern
  exclude_str_pattern <-
    "logo|static|users|avatar|profile|gif|scorecardresearch|facebook|trkn|svg|build|file-"

  # getting static images
  df_static <-
    kitties %>%
    rvest::html_attr(name = "src") %>%
    tibble::enframe(name = "id", value = "url") %>%
    dplyr::filter(!stringr::str_detect(url, exclude_str_pattern))

  # getting images with two source files (but retaining only the 480 pixel ones)
  df_srcset <-
    kitties %>%
    rvest::html_attr(name = "data-lazy-srcset") %>%
    stringr::str_split(string = ., pattern = ",", simplify = FALSE) %>%
    purrr::map(
      .f = ~ trimws(
        x = stringr::str_remove_all(string = ., pattern = "[1-9]x$"),
        which = "both"
      )
    ) %>%
    purrr::map(.f = stats::na.omit) %>%
    unlist() %>%
    tibble::enframe(name = "id", value = "url")

  # combining both images sets and giving them a unique id
  dplyr::bind_rows(df_static, df_srcset, .id = "image_type") %>%
    dplyr::mutate(id = dplyr::row_number(x = url)) %>%
    dplyr::arrange(id)
}
