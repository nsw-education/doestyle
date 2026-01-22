# Apply a DoE palette to the fill aesthetic

Apply a DoE palette to the fill aesthetic

## Usage

``` r
scale_fill_doe(
  palette = doe_palettes$default,
  discrete = TRUE,
  direction = 1,
  ...
)
```

## Arguments

- palette:

  An object of class
  [`palettes_palette`](https://mccarthy-m-g.github.io/palettes/reference/pal_palette.html).
  Several useful palettes are ready to use in the list `doe_palettes`,
  which is included with the `doestyle` package. The default is
  `doe_palettes$qualitative$default`, which uses all of the on-brand
  colours defined in the NSW Department of Education Brand Guidelines.

- discrete:

  Logical indicating whether the desired scale should be discrete. The
  default is `TRUE`. If `FALSE`, a continuous scale with interpolated
  colours will be constructed, instead.

- direction:

  Sets the order of colours in the scale. If 1, the default, colours are
  ordered from first to last as they appear in the palette. If -1, the
  order of colours is reversed.

- ...:

  Additional arguments passed to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  or
  [`ggplot2::continuous_scale()`](https://ggplot2.tidyverse.org/reference/continuous_scale.html).

## Value

A scale function that can be added to a
[ggplot2](https://ggplot2.tidyverse.org/reference/ggplot2-package.html)
plot.

## See also

- [doe_palettes](https://nsw-education.github.io/doestyle/reference/doe_palettes.md)
  for the palettes available in `doestyle`.

- [`palettes::scale_fill_palette_d()`](https://mccarthy-m-g.github.io/palettes/reference/scale_colour_palette_d.html)

- [`palettes::scale_fill_palette_c()`](https://mccarthy-m-g.github.io/palettes/reference/scale_colour_palette_d.html)

## Examples

``` r
library(doestyle)
library(dplyr)
library(ggplot2)

public_schools |>
  filter(grepl("Connected Communities", Principal_network)) |>
  ggplot(aes(x = Principal_network, fill = Level_of_schooling)) +
  geom_bar(colour = "black", position = position_dodge(preserve = "single")) +
  theme(legend.position = "bottom") +
  labs(y = "Schools") +
  # Add a default department scale to the `fill` aesthetic.
  scale_fill_doe()

```
