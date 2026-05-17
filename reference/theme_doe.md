# Apply the DoE theme to a ggplot2 plot

Apply a minimalist DoE theme. By default, sets the font family to Public
Sans and enables
[`showtext::showtext_auto()`](https://rdrr.io/pkg/showtext/man/showtext_auto.html)
to allow easy font display in plots.

## Usage

``` r
theme_doe(base_size = 16, base_family = "Public Sans", ...)
```

## Arguments

- base_size:

  Base font size, given in pts.

- base_family:

  Base font family. Defaults to the NSW Government on-brand font family,
  [Public Sans](https://github.com/uswds/public-sans).

- ...:

  Other parameters passed to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html).

## Examples

``` r
library(doestyle)
library(ggplot2)

public_schools |>
 ggplot(aes(y = Operational_directorate)) +
 geom_bar() +
 # Apply theme_doe(): minimal decoration and Public Sans typeface
 theme_doe()

```
