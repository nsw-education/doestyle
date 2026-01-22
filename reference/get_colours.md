# Get brand colours by name

Get brand colours by name

## Usage

``` r
get_colours(...)

doe_colours(...)

doe_cols(...)
```

## Arguments

- ...:

  Colour name(s). May be supplied as a character vector or as individual
  arguments.

## Value

`get_colours()` returns a character vector containing the hex values for
each requested brand colour.

## Details

`get_colours()` will only return hex values for valid NSW and Department
of Education colour names. To list available colours, use
[`list_doestyle_colours()`](https://nsw-education.github.io/doestyle/reference/list_doestyle_colours.md).
To plot available colours, use
[`show_colours()`](https://nsw-education.github.io/doestyle/reference/show_colours.md).

## Examples

``` r
get_colours("blue-01", "red-02", "blue-04")
#> <palettes_colour[3]>
#> • #002664
#> • #D7153A
#> • #CBEDFD
get_colours(c("red-01", "red-02", "red-03", "red-04"))
#> <palettes_colour[4]>
#> • #630019
#> • #D7153A
#> • #FFB8C1
#> • #FFE6EA
```
