#' @title Play a short kitty meow sound
#' @name meowR
#'
#' @description
#'
#' `meowR` is inspired by `beepr::beep`, which plays a short sound to notify
#' you, for example, when a script has finished. Instead of a beep, this
#' function produced a meow.
#'
#' @return No return value, called for side effect (sound).
#'
#' @param sound A character string or a number specifying what sound to be
#'   played by either specifying one of the built in sounds, specifying the path
#'   to a `.wav` file or specifying an URL. There are currently 6 meows
#'   included. The default is `3`.
#'
#' @importFrom beepr beep
#'
#' @examples
#' \donttest{
#' # play Eno's meow
#' kittyR::meowR(sound = 4)
#' }
#' @export

# function body
meowR <- function(sound = 3) {
  # if sound is out of range, give warning and play random sound
  if (!(sound %in% 1:6)) {
    message(
      paste0(
        "Warning: There are currently only 6 sounds available, you requested sound ", sound, ".\n",
        "Please see details in `meowR` help.\n",
        "Playing a random meow for now."
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

  # producing the sound
  beepr::beep(
    sound = system.file(paste0("sounds/", sounds[sound]), package = "kittyR"),
    expr = NULL
  )
}
