# Changelog

## doestyle (development version)

- Added Contributors’ Guide (Sam Gardiner)
- New geoms:
  [`geom_uperrorbar()`](https://nsw-education.github.io/doestyle/reference/geom_uperrorbar.md)
  and
  [`geom_downerrorbar()`](https://nsw-education.github.io/doestyle/reference/geom_downerrorbar.md)
  (Jonathan McGuire)
- New functions for generating secondary palettes for patterns and text:
  `get_secondary_colours()` and `get_text_colours()`. Secondary and text
  colours have been chosen to meet minimum accessibility standards for
  contrast. (Sam Gardiner)
- New functions for computing relative luminance and contrast ratio:
  [`relative_luminance()`](https://nsw-education.github.io/doestyle/reference/relative_luminance.md)
  and
  [`contrast_ratio()`](https://nsw-education.github.io/doestyle/reference/contrast_ratio.md).
  These functions can be used to check that colour combinations meet
  accessibility standards.

## doestyle 0.2.2

- Include example dataset `public_schools` (Sam Gardiner)

### Fixes

- Switch vignette renderer to knitr, to avoid package installation
  problems on some systems (Sam Gardiner)

## doestyle 0.2.1

- Pass arguments from
  [`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)
  to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html)
  via `...` (Matthew Finkbeiner)
- Added vignette “Extending
  [`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)”
  with examples (Matthew Finkbeiner, Sam Gardiner)

## doestyle 0.2.0

- Added optional arguments to
  [`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)
  to allow specification of fonts other than Public Sans and base size
  other than 16 points (Matthew Finkbeiner).

## doestyle 0.1.0

- Initial release.
