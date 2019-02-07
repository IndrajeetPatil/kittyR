
catR <- function() {

  # getting all cat images from webpage of interest
  kitties <-
    rvest::html_session(url = "https://pixabay.com/en/photos/cat/") %>%
    rvest::html_nodes(x = ., css = "img")

  # getting static images
  df_static <- kitties %>%
    rvest::html_attr(x = ., name = "src") %>%
    tibble::enframe(x = ., name = "id", value = "url") %>%
    dplyr::filter(.data = ., !stringr::str_detect(url, "static"))

  # getting images with two source files (but retaining only the 480 pixel ones)
  df_srcset <-
    kitties %>%
    rvest::html_attr(x = ., name = "data-lazy-srcset") %>%
    stringr::str_split(
      string = .,
      pattern = ",",
      simplify = FALSE
    ) %>%
    purrr::map(
      .x = .,
      .f = ~ trimws(
        x = stringr::str_remove_all(string = ., pattern = "[1-9]x$"),
        which = "both"
      )
    ) %>%
    purrr::map(.x = ., .f = stats::na.omit) %>%
    unlist(x = .) %>%
    tibble::enframe(x = ., name = "id", value = "url") %>%
    dplyr::filter(.data = ., !grepl("340.jpg$", url))

  # combining both images sets and giving them a unique id
  df_combined <- dplyr::bind_rows(df_static, df_srcset, .id = "image_type") %>%
    dplyr::mutate(.data = ., id = dplyr::row_number(x = url)) %>%
    dplyr::arrange(.data = ., id)

  # create a temporary dierctory
  temporary_file_location <- paste0(tempdir(), "/kitties.png")

  # download a random image
  utils::download.file(
    url = df_combined[sample(x = 1:length(df_combined), size = 1L)],
    destfile = temporary_file_location,
    mode = "wb"
  )

  # Bring the doggo to R
  kitty <- imager::load.image(temporary_file_location)

  # display the cat
  plot(kitty, yaxt = "n", axes = FALSE)
}
