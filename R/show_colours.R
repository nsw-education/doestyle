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
#' @export
#'
#' @returns `show_colours()` returns a `ggplot2` `gg` object, which
#'   can be further manipulated with user-specified themes etc.
#'
#' @examples
#' show_colours()
show_colours <- function(swatches = c("brand", "primary", "nsw", "all")) {

  # Filter our built-in colourdata tibble based on the 'set' argument
  swatches <- match.arg(swatches)
  filter_expr <- switch(
    swatches,
    "brand" = quote(doe_brand),
    "primary" = quote(doe_primary),
    "nsw" = quote(nsw_brand),
    "all" = quote(TRUE),
    )
  filterdata <- subset(doestyle::colourdata, eval(filter_expr))

  # Print the desired swatches
  filterdata |>
    ggplot(aes(x = 1, y = 1, fill = colour_name)) +
    geom_raster() +
    geom_text(aes(label = colour_name),
              size = 9 / .pt) +
    facet_grid(tone ~ family, switch = "y") +
    scale_fill_manual(values = with(filterdata,
                                    purrr::set_names(hex_value, colour_name))) +
    theme_void() +
    theme(legend.position = "none",
          strip.text = element_text(size = 9))
}
