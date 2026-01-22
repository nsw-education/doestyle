# Show swatches for `doestyle` colours

`show_colours()` produces a plot that shows and names the colours
available in `doestyle`.

## Usage

``` r
show_colours(swatches = c("brand", "primary", "nsw", "all"), linewidth = 1)
```

## Arguments

- swatches:

  The name of a set of colours to display. "`brand`" displays the
  department's brand colours only; "`primary`" shows the department's
  primary brand colours only; "`nsw`" shows all NSW Government brand
  colours; and "`all`" shows every colour included in `doestyle`,
  including additional off-brand colours for UX element specified in the
  department's Brand guidelines document.

- linewidth:

  The thickness of each swatch's coloured border.

## Value

`show_colours()` returns a `ggplot2` `gg` object, which can be further
manipulated with user-specified themes etc.

## Examples

``` r
show_colours()
```
