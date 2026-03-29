# Prepare a dataframe with URLs for cat pictures.

Mostly useful for internal workings of this package, this function
extracts images at given URL and returns it in a data frame.

## Usage

``` r
kitty_pics_df(url, ...)
```

## Arguments

- url:

  URL for the source from which individual image URLs are to be
  extracted.

- ...:

  Currently ignored.

## Value

A tibble containing extracted details from the provided URL.

## Examples

``` r
set.seed(123)
kittyR::kitty_pics_df("https://unsplash.com/s/photos/kitten/")
#> Warning: Unauthorized (HTTP 401).
#> Error in read_html.response(x$response, ..., base_url = x$url): Unauthorized (HTTP 401).
```
