#' @title Play a short kitty meow sound.
#' @name meowR
#' @author \href{https://github.com/IndrajeetPatil/}{Indrajeet Patil}
#'
#' @param sound A character string or a number specifying what sound to be
#'   played by either specifying one of the built in sounds, specifying the path
#'   to a `.wav` file or specifying an url. There are currently 6 meows
#'   included. The default is `3`.
#'
#' @importFrom beepr beep
#'
#' @examples
#' \dontrun{
#' # play Eno's meow
#' kittyR::meowR(sound = 4)
#' }
#' @export

# function body
meowR <- function(sound = 3) {
  # if sound is out of range, give warning and play random sound
  if (!(sound %in% 1:6)) {
    message(
      glue::glue(
        "Warning: There are currently only 6 sounds available, you requested sound {sound}.\n
        Please see details in `meowR` help.\n
        Playing a random meow."
      )
    )

    # randomly select a sound
    sound <- sample(x = 1:6, size = 1)
  }

  # a vector of cat sounds
  sounds <- c(
    Tom = "1.wav",
    Toops = "2.wav",
    Eno = "3.wav",
    Pari = "4.wav",
    Cicci = "5.wav",
    Titti = "6.wav"
  )

  # giving the sound path
  sound_path <-
    system.file(paste("sounds/", sounds[sound], sep = ""), package = "kittyR")

  # producing the sound
  beepr::beep(sound = sound_path, expr = NULL)
}
