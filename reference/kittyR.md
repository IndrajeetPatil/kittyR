# Cats in R console.

This function displays a picture of a cat and plays a short sound clip
containing cat meow. It is possible that once in a while you might get a
picture that is in no way feline related. In such cases, just try again.

Currently, the images are collected from the following sources-

- <https://unsplash.com/s/photos/cat/>

- <https://unsplash.com/s/photos/kitten/>

The sound files come from the following CC BY 3.0 source:
<https://soundbible.com/>

## Usage

``` r
kittyR(url = NULL, meow = TRUE, sound = 3, only_kitten = FALSE, ...)
```

## Arguments

- url:

  An URL for the source from which individual image URLs are to be
  extracted. Default is `NULL`. If `NULL`, a randomly drawn image from
  the default collection will be shown.

- meow:

  Logical that decides whether to play a meow sound along with the
  picture of a cat.

- sound:

  A character string or a number specifying which sound is to be played
  by specifying one of the built-in sounds (stored in `.wav` files).
  There are currently 6 meows included. The default is third one (`3`).

- only_kitten:

  Logical that decides whether only kitten pics should be selected
  (default: `FALSE`).

- ...:

  Additional arguments (currently ignored).

## Value

A photo of a cat is downloaded and displayed in the plot window.

## Examples

``` r
# \donttest{
library(kittyR)

# relying on default collection
set.seed(122)
kittyR(meow = FALSE)
#> Warning: Unauthorized (HTTP 401).
#> Error in pmap(.l, .f, ...): ℹ In index: 1.
#> ℹ With name: "https://unsplash.com/s/photos/cat/".
#> Caused by error in `read_html.response()`:
#> ! Unauthorized (HTTP 401).

# in case you want only pics of kittens
set.seed(111)
kittyR(meow = FALSE, only_kitten = TRUE)
#> Warning: Unauthorized (HTTP 401).
#> Error in pmap(.l, .f, ...): ℹ In index: 1.
#> ℹ With name: "https://unsplash.com/s/photos/kitten/".
#> Caused by error in `read_html.response()`:
#> ! Unauthorized (HTTP 401).

# provide a custom URL
set.seed(300)
kittyR(
  url = "https://unsplash.com/s/photos/cat/",
  meow = FALSE
)
#> Warning: Unauthorized (HTTP 401).
#> Error in read_html.response(x$response, ..., base_url = x$url): Unauthorized (HTTP 401).
# }
```
