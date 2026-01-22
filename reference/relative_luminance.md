# Compute the relative luminance of an sRGB colour

Compute the relative luminance of sRGB colour(s). See [WCAG 2.1
definition: relative
luminance](https://www.w3.org/TR/WCAG21/#dfn-relative-luminance).

## Usage

``` r
relative_luminance(hex_values)
```

## Arguments

- hex_values:

  A character vector of hex value(s).

## Value

`relative_luminance()` returns a numeric vector of luminance values.

## Examples

``` r
relative_luminance(c("#ffffff", "#000000", "#002664", "#d7153a"))
#> [1] 1.00000000 0.00000000 0.02306327 0.15288892
relative_luminance(doe_cols("white", "black", "blue-01", "red-02"))
#> [1] 1.00000000 0.00000000 0.02306327 0.15288892
```
