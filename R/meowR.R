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
#' @param sound A character string or a number specifying which sound is to be
#'   played by specifying one of the built-in sounds (stored in `.wav` files).
#'   There are currently 6 meows included. The default is third one (`3`).
#'
#' @importFrom beepr beep
#'
#' @examples
#' \donttest{
#' kittyR::meowR(sound = 4)
#' }
#' @export
meowR <- function(sound = 3) {
  # if sound is out of range, give warning and play random sound
  if (!(sound %in% 1:6)) {
    warning(
      paste0(
        "There are currently only 6 sounds available, you requested sound number ", sound, ".\n",
        "Please see details in `meowR()` help.\n",
        "Playing a random meow for now."
      )
    )

    # randomly select a sound
    sound <- sample(x = 1:6, size = 1)
  }

  # a named vector of cat sounds
  sounds <- c(
    Tom   = "1.wav",
    Toops = "2.wav",
    Eno   = "3.wav",
    Pari  = "4.wav",
    Cicci = "5.wav",
    Titti = "6.wav"
  )

  # producing the sound
  beepr::beep(
    sound = system.file(paste0("sounds/", sounds[sound]), package = "kittyR"),
    expr = NULL
  )
}
