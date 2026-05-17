# doestyle (development version)

* Include a copy of the Public Sans font family (@gardiners)

# doestyle 0.3.0

## Added

* Added Contributors' Guide (@gardiners)
* New geoms: `geom_uperrorbar()` and `geom_downerrorbar()` (@JonathanMcGuire)
* New functions for generating secondary palettes for patterns and text:
  `get_secondary_colours()` and `get_text_colours()`. Secondary and text colours
  have been chosen to meet minimum accessibility standards for contrast. 
  (@gardiners)
* New functions for computing relative luminance and contrast ratio:
  `relative_luminance()` and `contrast_ratio()`. These functions can be used to
  check that colour combinations meet accessibility standards. (@gardiners)
  
## Fixes

* `check_font_families()` now correctly checks for the presence of Public Sans
  before loading it (#32, @gardiners)

# doestyle 0.2.2

* Include example dataset `public_schools` (@gardiners)

## Fixes

* Switch vignette renderer to knitr, to avoid package installation problems on
  some systems (@gardiners) 

# doestyle 0.2.1

* Pass arguments from `theme_doe()` to `ggplot2::theme()` via `...`
  (@matthewfinkbeiner)
* Added vignette "Extending `theme_doe()`" with examples (@matthewfinkbeiner,
  @gardiners)

# doestyle 0.2.0

* Added optional arguments to `theme_doe()` to allow specification of fonts
  other than Public Sans and base size other than 16 points
  (@matthewfinkbeiner).

# doestyle 0.1.0

* Initial release.
