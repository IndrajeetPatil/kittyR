
<!-- README.md is generated from README.Rmd. Please edit that file -->

# kittyR: Kitty pictures and meows from R console <img src="man/figures/logo.png" align="right" width="240" />

[![lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R build
status](https://github.com/IndrajeetPatil/kittyR/workflows/R-CMD-check/badge.svg)](https://github.com/IndrajeetPatil/kittyR)
[![pkgdown](https://github.com/IndrajeetPatil/kittyR/workflows/pkgdown/badge.svg)](https://github.com/IndrajeetPatil/kittyR/actions)

This package is designed for rainy days when your results are
heartbreaking or when no matter what you try, you can’t seem to get rid
of that bug. Take a respite from those negative thoughts by accessing
kitty pictures **and** their adorable meows right from your R console 😻
and then get back to work again.

May these kitties bring some joy and amusement during your stressful
data cleaning jobs! 😊

# Installation

The package is available only on `GitHub`:

``` r
# install.packages("remotes")
remotes::install_github("IndrajeetPatil/kittyR")
```

# Functions

There are only two functions in this package-

## `kittyR()`

In case you want a picture of a kitty:

``` r
# to always have the same kitty on README
set.seed(20)

# show me the kitty NOW!
kittyR(meow = FALSE)
```

<img src="man/figures/README-kittyR1-1.png" width="100%" />

By default, the collection will include any kind of cat (big, small,
wild, etc.). If you want only kittens, you can use an additional
argument.

``` r
# to always have the same kitty on README
set.seed(144)

# show me the kitten NOW!
kittyR(meow = FALSE, only_kitten = TRUE)
```

<img src="man/figures/README-kittyR2-1.png" width="100%" />

The collection of cat pictures comes from the following collections of
freely available images:

- <https://unsplash.com/s/photos/cat/>
- <https://unsplash.com/s/photos/kitten/>

## `meowR()`

In case you just want to hear a meow either *apropos* nothing or at the
end of execution of some code to let you know that the execution is
complete, just include this line of code:

``` r
# meow meow meow
# you can choose from a sample of six meows
meowR(sound = 4)
```

There are only six meows available at the moment.

<table style="text-align: center; vertical-align: middle;">
<thead>
<tr>
<th>
Sound ID
</th>
<th>
Meows
</th>
</tr>
</thead>
<tbody>
<tr>
<td>
1
</td>
<td>
<audio controls="">
<source src="man/figures/1.wav" type="audio/wav">
<source src="reference/figures/1.wav" type="audio/wav">
</audio>
</td>
</tr>
<tr>
<td>
2
</td>
<td>
<audio controls="">
<source src="man/figures/2.wav" type="audio/wav">
<source src="reference/figures/2.wav" type="audio/wav">
</audio>
</td>
</tr>
<tr>
<td>
3
</td>
<td>
<audio controls="">
<source src="man/figures/3.wav" type="audio/wav">
<source src="reference/figures/3.wav" type="audio/wav">
</audio>
</td>
</tr>
<tr>
<td>
4
</td>
<td>
<audio controls="">
<source src="man/figures/4.wav" type="audio/wav">
<source src="reference/figures/4.wav" type="audio/wav">
</audio>
</td>
</tr>
<tr>
<td>
5
</td>
<td>
<audio controls="">
<source src="man/figures/5.wav" type="audio/wav">
<source src="reference/figures/5.wav" type="audio/wav">
</audio>
</td>
</tr>
<tr>
<td>
6
</td>
<td>
<audio controls="">
<source src="man/figures/6.wav" type="audio/wav">
<source src="reference/figures/6.wav" type="audio/wav">
</audio>
</td>
</tr>
</tbody>
</table>

If you have a kitty meow that you like and would like to include in the
package, please either make a PR or e-mail it to me and I will include
it.

# Acknowledgments

This package was inspired by
[pupR](https://github.com/melissanjohnson/pupR) package by Melissa
Innerst.

The hexsticker was generously designed by Sarah Otterstetter (Max Planck
Institute for Human Development, Berlin).

# Code of Conduct

Please note that the `kittyR` project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
