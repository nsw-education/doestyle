# doestyle (development version)

* Added Contributors' Guide (Sam Gardiner)
* New geoms: `geom_uperrorbar()` and `geom_downerrorbar()` (Jonathan McGuire)
* New functions for generating secondary palettes for patterns and text:
  `get_secondary_colours()` and `get_text_colours()`. Secondary and text colours
  have been chosen to meet minimum accessibility standards for contrast. 
  (Sam Gardiner)
* New functions for computing relative luminance and contrast ratio:
  `relative_luminance()` and `contrast_ratio()`. These functions can be used to
  check that colour combinations meet accessibility standards. 

# doestyle 0.2.2

* Include example dataset `public_schools` (Sam Gardiner)

## Fixes

* Switch vignette renderer to knitr, to avoid package installation problems on
  some systems (Sam Gardiner) 

# doestyle 0.2.1

* Pass arguments from `theme_doe()` to `ggplot2::theme()` via `...` (Matthew
  Finkbeiner)
* Added vignette "Extending `theme_doe()`" with examples (Matthew Finkbeiner,
  Sam Gardiner)

# doestyle 0.2.0

* Added optional arguments to `theme_doe()` to allow specification of fonts
  other than Public Sans and base size other than 16 points
  (Matthew Finkbeiner).

# doestyle 0.1.0

* Initial release.
