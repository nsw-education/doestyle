# Legacy colours:

core_NSW_Blue="#002664"
core_NSW_Red="#d7153a"

# 2023 February 22 NSW Government Masterbrand
# https://github.com/digitalnsw/nsw-design-system
# https://github.com/digitalnsw/nsw-design-system/blob/master/src/core/colour/json/palettes.json

NSW_MasterBrand_Grey01="#22272b"
NSW_MasterBrand_Grey02="#495054"
NSW_MasterBrand_Grey03="#cdd3d6"
NSW_MasterBrand_Grey04="#ebebeb"

NSW_MasterBrand_Green01="#004000"
NSW_MasterBrand_Green02="#00aa45"
NSW_MasterBrand_Green03="#a8edb3"
NSW_MasterBrand_Green04="#dbfadf"

NSW_MasterBrand_Teal01="#0b3f47"
NSW_MasterBrand_Teal02="#2e808e"
NSW_MasterBrand_Teal03="#8cdbe5"
NSW_MasterBrand_Teal04="#d1eeea"

NSW_MasterBrand_Blue01="#002664"
NSW_MasterBrand_Blue02="#146cfd"
NSW_MasterBrand_Blue03="#8ce0ff"
NSW_MasterBrand_Blue04="#cbedfd"

NSW_MasterBrand_Purple01="#441170"
NSW_MasterBrand_Purple02="#8055f1"
NSW_MasterBrand_Purple03="#cebfff"
NSW_MasterBrand_Purple04="#e6e1fd"

NSW_MasterBrand_Fuchsia01="#65004d"
NSW_MasterBrand_Fuchsia02="#d912ae"
NSW_MasterBrand_Fuchsia03="#f4b5e6"
NSW_MasterBrand_Fuchsia04="#fddef2"

NSW_MasterBrand_Red01="#630019"
NSW_MasterBrand_Red02="#d7153a"
NSW_MasterBrand_Red03="#ffb8c1"
NSW_MasterBrand_Red04="#ffe6ea"

NSW_MasterBrand_Orange01="#941b00"
NSW_MasterBrand_Orange02="#f3631b"
NSW_MasterBrand_Orange03="#ffce99"
NSW_MasterBrand_Orange04="#fdeddf"

NSW_MasterBrand_Yellow01="#644800"
NSW_MasterBrand_Yellow02="#faaf05"
NSW_MasterBrand_Yellow03="#fde79a"
NSW_MasterBrand_Yellow04="#fff4cf"

NSW_MasterBrand_Brown01="#523719"
NSW_MasterBrand_Brown02="#b68d5d"
NSW_MasterBrand_Brown03="#e8d0b5"
NSW_MasterBrand_Brown04="#ede3d7"

# Additional colours used by the theme_doe_flex theme

# The DoE palette is a subset of the NSW master brand palette

doe_colors <- c(
  `navy`           = NSW_MasterBrand_Blue01,
  `red`            = NSW_MasterBrand_Red02,
  `baby_blue`      = NSW_MasterBrand_Blue04,
  `white`          = "#FFFFFF",
  `blue_mid`       = NSW_MasterBrand_Blue02,
  `blue_tertiary`  = NSW_MasterBrand_Blue03,
  `highlight_pink` = NSW_MasterBrand_Red01,
  `peach`          = NSW_MasterBrand_Red03)


#' Function to extract doe colors as hex codes
#'
#' @param ... Character names of doe_colors
#'
doe_cols <- function(...) {
  cols <- c(...)
  if (is.null(cols))
    return (doe_colors)
  doe_colors[cols]
}

## define doe palettes -------------------------------------------------------

# List of doe palettes

doe_palettes <- list(
  `baby_blue_red` = doe_cols("baby_blue", "red"),
  `navy_red` = doe_cols("navy", "red"),
  `light_shades` = doe_cols("baby_blue", "peach"),
  `two_blues` = doe_cols("baby_blue", "navy"),
  `three_color` = doe_cols("red", "navy", "baby_blue"),
  `default` = doe_cols("navy", "blue_tertiary", "red"),
  `red_to_blue` = doe_cols("red", "highlight_pink", "blue_mid", "navy")
)

palettes<- c("default", "baby_blue_red", "navy_red", "light_shades", "two_blues", "three_color", "red_to_blue")

#' Return function to interpolate a doe color palette
#' Makes it possible to create shades between our original colours
#'
#' @param palette Character name of palette in doe_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#' @export
#'
doe_pal <- function(palette = "default", reverse = FALSE, ...) {
  pal <- doe_palettes[[palette]]
  if (reverse) pal <- rev(pal)
  colorRampPalette(pal, ...)
}
