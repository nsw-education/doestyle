# Get secondary colours for named brand colours

Secondary colours are on-brand colours that can be used for pattern
fills or other visual elements that need contrast against an on-brand
fill colour. Each NSW Design System colour has a corresponding secondary
colour available via `secondary_colours()`.

## Usage

``` r
secondary_colours(...)
```

## Arguments

- ...:

  Colour name(s). May be supplied as a character vector or as individual
  arguments.

## Value

`secondary_colours()` returns the hex value of an appropriate secondary
colour for each on-brand colour name supplied in its arguments.

## Examples

``` r
secondary_colours("red-02", "blue-01", "blue-04")
#> <palettes_colour[3]>
#> • #FFB8C1
#> • #146CFD
#> • #002664
```
