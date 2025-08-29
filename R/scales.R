#' Apply a DoE palette to the colour aesthetic
#'
#' @param palette An object of class
#'   [`palettes_palette`][palettes::pal_palette()]. Several useful palettes are
#'   ready to use in the list `doe_palettes`, which is included with the
#'   `doestyle` package. The default is `doe_palettes$qualitative$default`,
#'   which uses all of the on-brand colours defined in the NSW Department of
#'   Education Brand Guidelines.
#' @param discrete Logical indicating whether the desired scale should be
#'   discrete. The default is `TRUE`. If `FALSE`, a continuous scale with
#'   interpolated colours will be constructed, instead.
#' @param direction Sets the order of colours in the scale. If 1, the default,
#'   colours are ordered from first to last as they appear in the palette. If
#'   -1, the order of colours is reversed.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()] or
#'   [ggplot2::continuous_scale()].
#' @returns A scale function that can be added to a
#'   [ggplot2][ggplot2::ggplot2-package] plot.
#' @seealso
#'  - [doe_palettes] for the palettes available in `doestyle`.
#'  - [palettes::scale_colour_palette_d()]
#'  - [palettes::scale_colour_palette_c()]
#'
#' @examples
#' library(dplyr)
#' library(ggplot2)
#' library(doestyle)
#'
#' # Plot growth in primary and secondary schools over time
#' public_schools |>
#'  filter(Level_of_schooling %in% c("Primary School", "Secondary School")) |>
#'  arrange(Date_1st_teacher) |>
#'  mutate(
#'    count = 1,
#'    cumulative_schools = cumsum(count),
#'    .by = Level_of_schooling) |>
#'  ggplot(aes(x = Date_1st_teacher,
#'             y = cumulative_schools,
#'             colour = Level_of_schooling)) +
#'  geom_step() +
#'  # Add a default DoE colour scale
#'  scale_colour_doe()
#'
#' @export
scale_colour_doe <- function(palette = doe_palettes$default,
                             discrete = TRUE,
                             direction = 1,
                             ...) {
  stopifnot(is.logical(discrete),
            direction %in% c(1, -1))

  if (discrete) {
    palettes::scale_colour_palette_d(palette = palette,
                                     direction = direction,
                                     ...)
  } else {
    palettes::scale_colour_palette_c(palette = palette,
                                     direction = direction,
                                     ...)
  }
}

#' Apply a DoE palette to the fill aesthetic
#' @inherit scale_colour_doe params return
#' @seealso
#'  - [doe_palettes] for the palettes available in `doestyle`.
#'  - [palettes::scale_fill_palette_d()]
#'  - [palettes::scale_fill_palette_c()]
#' @export
scale_fill_doe <- function(palette = doe_palettes$default,
                           discrete = TRUE,
                           direction = 1,
                           ...) {
  stopifnot(is.logical(discrete),
            direction %in% c(1, -1))
  if (discrete) {
    palettes::scale_fill_palette_d(palette = palette,
                                   direction = direction,
                                   ...)
  } else {
    palettes::scale_fill_palette_c(palette = palette,
                                   direction = direction,
                                   ...)
  }
}
