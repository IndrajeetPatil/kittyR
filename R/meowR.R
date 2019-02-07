#' @title Play a short kitty meow sound.
#' @name meowR
#' @author \href{https://github.com/IndrajeetPatil/}{Indrajeet Patil}
#'
#' @param sound A character string or a number specifying what sound to be
#'   played by either specifying one of the built in sounds, specifying the path
#'   to a `.wav` file or specifying an url. There are currently 6 meows
#'   included. The default is `1`.
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
