# doe color and fill scale constructors -----------------------------------------------

#' Color scale constructor for doe colors
#'
#' @param palette Character name of palette in doe_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#' scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export

scale_color_doe <- function(palette = c("default", "baby_blue_red", "navy_red", "light_shades", "two_blues", "three_color", "red_to_blue"),
                            discrete = TRUE,
                            reverse = FALSE, ...) {
  pal <- doe_pal(palette = match.arg(palette), reverse = reverse)
  if (discrete) {
    discrete_scale("colour", paste0("doe_", palette), palette =
                     pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}


#' Colour scale constructor for doe colors
#'
#' @param palette Character name of palette in doe_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#' scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export

scale_colour_doe <- function(palette = c("default", "baby_blue_red", "navy_red", "light_shades", "two_blues", "three_color", "red_to_blue"),
                             discrete = TRUE,
                             reverse = FALSE, ...) {
  pal <- doe_pal(palette = match.arg(palette), reverse = reverse)
  if (discrete) {
    discrete_scale("colour", paste0("doe_", palette), palette =
                     pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for doe colors
#'
#' @param palette Character name of palette in doe_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#' scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#' @export

scale_fill_doe <- function(palette = c("default", "baby_blue_red", "navy_red", "light_shades", "two_blues", "three_color", "red_to_blue"),
                           discrete = TRUE,
                           reverse = FALSE, ...) {
  pal <- doe_pal(palette = match.arg(palette), reverse = reverse)
  if (discrete) {
    discrete_scale("fill", paste0("doe_", palette), palette = pal,
                   ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
