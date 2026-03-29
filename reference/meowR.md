# Play a short kitty meow sound

`meowR` is inspired by
[`beepr::beep`](https://rdrr.io/pkg/beepr/man/beep.html), which plays a
short sound to notify you, for example, when a script has finished.
Instead of a beep, this function produced a meow.

## Usage

``` r
meowR(sound = 3)
```

## Arguments

- sound:

  A character string or a number specifying which sound is to be played
  by specifying one of the built-in sounds (stored in `.wav` files).
  There are currently 6 meows included. The default is third one (`3`).

## Value

No return value, called for side effect (sound).

## Examples

``` r
# \donttest{
kittyR::meowR(sound = 4)
# }
```
