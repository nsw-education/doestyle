#' Show swatches for `doestyle` colours
#'
#' `show_colours()` produces a plot that shows and names the colours available
#' in `doestyle`.
#'
#' @param swatches The name of a set of colours to display. "`brand`" displays
#'   the department's brand colours only; "`primary`" shows the department's
#'   primary brand colours only; "`nsw`" shows all NSW Government brand colours;
#'   and "`all`" shows every colour included in `doestyle`, including additional
#'   off-brand colours for UX element specified in the department's Brand
#'   guidelines document.
#'
#' @param linewidth The thickness of each swatch's coloured border.
#'
#' @export
#'
#' @returns `show_colours()` returns a `ggplot2` `gg` object, which can be
#'   further manipulated with user-specified themes etc.
#'
#' @examples
#' show_colours()
show_colours <- function(swatches = c("brand", "primary", "nsw", "all"),
                         linewidth = 1) {
  # Filter our built-in colourdata tibble based on the 'set' argument
  swatches <- match.arg(swatches)
  filter_expr <- switch(
    swatches,
    "brand" = quote(doe_brand),
    "primary" = quote(doe_primary),
    "nsw" = quote(nsw_brand),
    "all" = quote(TRUE),
    )

  # Colour order as displayed on NSW Design System swatches. We'd like
  # show_colours() to present them in the same order, for consistency and manual
  # cross-referencing.
  family_order <- c("grey", "green", "teal", "blue", "purple", "fuchsia", "red",
                    "orange", "yellow", "brown", "neutral")

  filterdata <- dplyr::filter(doestyle::colourdata, eval(filter_expr)) |>
    dplyr::mutate(label = paste(colour_name, hex_value, sep = "\n"),
                  fmly = factor(family, levels = family_order))

  fill_values <- with(
    filterdata,
    purrr::set_names(get_colours(colour_name), colour_name))
  text_values <- with(
    filterdata,
    purrr::set_names(text_colours(colour_name), colour_name))
  secondary_values <- with(
    filterdata,
    purrr::set_names(secondary_colours(colour_name), colour_name))

  # Print the desired swatches
  filterdata |>
    ggplot(aes(x = .data$fmly, y = .data$tone, fill = .data$colour_name,
               label = .data$label)) +
    geom_tile(height = 3/4,
              width = 3/4,
              linewidth = linewidth,
              colour = secondary_values) +
    geom_text(colour = text_values,
              size = 9 / .pt) +
    scale_fill_manual(values = fill_values) +
    scale_y_reverse() +
    theme_void() +
    theme(legend.position = "none",
          strip.text = element_blank())
}
