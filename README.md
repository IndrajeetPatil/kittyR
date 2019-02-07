
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN\_Release\_Badge](http://www.r-pkg.org/badges/version-ago/kittyR)](https://CRAN.R-project.org/package=kittyR)
[![Travis Build
Status](https://travis-ci.org/IndrajeetPatil/kittyR.svg?branch=master)](https://travis-ci.org/IndrajeetPatil/kittyR)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/IndrajeetPatil/kittyR?branch=master&svg=true)](https://ci.appveyor.com/project/IndrajeetPatil/kittyR)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Last-changedate](https://img.shields.io/badge/last%20change-2019--02--07-yellowgreen.svg)](/commits/master)
[![GitHub code size in
bytes](https://img.shields.io/github/languages/code-size/IndrajeetPatil/kittyR.svg)](https://github.com/IndrajeetPatil/kittyR)

# kittyR

This is cat people’s version of a package called
[pupR](https://github.com/melissanjohnson/pupR) by Melissa Innerst.
Instead of doggos, you will get kitties **and** their adorable meows in
your R console. 😻

You can get the development version from [GitHub](https://github.com/)
with:

``` r
# install.packages("remotes")
remotes::install_github("IndrajeetPatil/kittyR")
```

There are only two available functions in this package-

In case you want a picture of a kitty:

``` r
# to always have the same kitty on README
set.seed(100)

# show me the kitty NOW!
kittyR::kittyR()
```

<img src="man/figures/README-kittyR-1.png" width="100%" />

The collection of cat pictures comes from the following collections of
freely available images:

  - <https://pixabay.com/en/photos/cat/>
  - <https://www.pexels.com/search/cat/>

In case you just want to hear a meow either *apropos* nothing or at the
end of execution of some code to let you know that the execution is
complete, just include this line of code:

``` r
# can't print the sound, so
# meow meow meow
# you can choose from a sample of sounds included in the package
kittyR::meowR(sound = 4)
```

If you have a kitty meow that you like and would like to include in the
package, please either make a PR or e-mail it to me and I will include
it.

May these kitties bring some joy and amusement during your stressful
data digging jobs\!
