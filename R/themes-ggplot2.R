#' Apply the DoE theme to a ggplot2 plot
#'
#' Apply a minimalist DoE theme. By default, sets the font family to Public Sans
#' and enables [showtext::showtext_auto()] to allow easy font display in plots.
#'
#' @param base_size Base font size, given in pts.
#' @param base_family Base font family. Defaults to the NSW Government on-brand
#'   font family, [Public Sans](https://github.com/uswds/public-sans).
#' @param ... Other parameters passed to [ggplot2::theme()].
#'
#' @examples
#' library(doestyle)
#' library(ggplot2)
#'
#' public_schools |>
#'  ggplot(aes(y = Operational_directorate)) +
#'  geom_bar() +
#'  # Apply theme_doe(): minimal decoration and Public Sans typeface
#'  theme_doe()
#'
#' @export
theme_doe <- function(base_size = 16, base_family = "Public Sans", ...){

  # Check that Public Sans is available and issue a warning if it isn't
  if (base_family == "Public Sans") check_font_families()


  font <- base_family # set font family first
  theme_minimal() %+replace% # replace elements we want to change
    theme(
      # Text elements
      text = element_text(family = font,
                          size = base_size,
                          color = "grey30"),

      # Grid elements
      panel.grid.minor.y = element_blank(),
      panel.grid.minor.x = element_blank(),

      # Legend elements
      legend.position = "bottom",
      legend.text = element_text(size = rel(0.7)),
      legend.title = element_text(size = rel(0.7)),
      ...
    )
}
