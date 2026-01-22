# Get text colours for named brand colours

Text colours are designed for plotting text over an on-brand fill
colour. Each NSW Design System colour has a corresponding text colour
available via `text_colours()`.

## Usage

``` r
text_colours(...)
```

## Arguments

- ...:

  Colour name(s). May be supplied as a character vector or as individual
  arguments.

## Value

[`secondary_colours()`](https://nsw-education.github.io/doestyle/reference/secondary_colours.md)
returns the hex value of an appropriate text colour for each on-brand
colour name supplied in its arguments.

## Examples

``` r
text_colours("red-02", "blue-01", "blue-04")
#> <palettes_colour[3]>
#> • #FFFFFF
#> • #FFFFFF
#> • #000000
```
