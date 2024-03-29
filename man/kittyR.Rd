% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kittyR.R
\name{kittyR}
\alias{kittyR}
\title{Cats in R console.}
\usage{
kittyR(url = NULL, meow = TRUE, sound = 3, only_kitten = FALSE, ...)
}
\arguments{
\item{url}{An URL for the source from which individual image URLs are to be
extracted. Default is \code{NULL}. If \code{NULL}, a randomly drawn image from the
default collection will be shown.}

\item{meow}{Logical that decides whether to play a meow sound along with the
picture of a cat.}

\item{sound}{A character string or a number specifying which sound is to be
played by specifying one of the built-in sounds (stored in \code{.wav} files).
There are currently 6 meows included. The default is third one (\code{3}).}

\item{only_kitten}{Logical that decides whether only kitten pics should be
selected (default: \code{FALSE}).}

\item{...}{Additional arguments (currently ignored).}
}
\value{
A photo of a cat is downloaded and displayed in the plot window.
}
\description{
This function displays a picture of a cat and plays a short sound clip
containing cat meow. It is possible that once in a while you might get a
picture that is in no way feline related. In such cases, just try again.

Currently, the images are collected from the following sources-
\itemize{
\item \url{https://unsplash.com/s/photos/cat/}
\item \url{https://unsplash.com/s/photos/kitten/}
}

The sound files come from the following CC BY 3.0 source:
\url{https://soundbible.com/}
}
\examples{
\donttest{
library(kittyR)

# relying on default collection
set.seed(122)
kittyR(meow = FALSE)

# in case you want only pics of kittens
set.seed(111)
kittyR(meow = FALSE, only_kitten = TRUE)

# provide a custom URL
set.seed(300)
kittyR(
  url = "https://unsplash.com/s/photos/cat/",
  meow = FALSE
)
}
}
