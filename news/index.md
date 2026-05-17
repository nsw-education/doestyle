# Changelog

## doestyle (development version)

- Include a copy of the Public Sans font family (1)

## doestyle 0.3.0

### Added

- Added Contributors’ Guide (1)
- New geoms:
  [`geom_uperrorbar()`](https://nsw-education.github.io/doestyle/reference/geom_uperrorbar.md)
  and
  [`geom_downerrorbar()`](https://nsw-education.github.io/doestyle/reference/geom_downerrorbar.md)
  ([@JonathanMcGuire](https://github.com/JonathanMcGuire))
- New functions for generating secondary palettes for patterns and text:
  `get_secondary_colours()` and `get_text_colours()`. Secondary and text
  colours have been chosen to meet minimum accessibility standards for
  contrast.
  1.  
- New functions for computing relative luminance and contrast ratio:
  [`relative_luminance()`](https://nsw-education.github.io/doestyle/reference/relative_luminance.md)
  and
  [`contrast_ratio()`](https://nsw-education.github.io/doestyle/reference/contrast_ratio.md).
  These functions can be used to check that colour combinations meet
  accessibility standards. (1)

### Fixes

- [`check_font_families()`](https://nsw-education.github.io/doestyle/reference/check_font_families.md)
  now correctly checks for the presence of Public Sans before loading it
  ([\#32](https://github.com/nsw-education/doestyle/issues/32), 1)

## doestyle 0.2.2

- Include example dataset `public_schools` (1)

### Fixes

- Switch vignette renderer to knitr, to avoid package installation
  problems on some systems (1)

## doestyle 0.2.1

- Pass arguments from
  [`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)
  to
  [`ggplot2::theme()`](https://ggplot2.tidyverse.org/reference/theme.html)
  via `...`
  2.  
- Added vignette “Extending
  [`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)”
  with examples (2,
  1.  

## doestyle 0.2.0

- Added optional arguments to
  [`theme_doe()`](https://nsw-education.github.io/doestyle/reference/theme_doe.md)
  to allow specification of fonts other than Public Sans and base size
  other than 16 points (2).

## doestyle 0.1.0

- Initial release.
