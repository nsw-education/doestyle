#' Apply the DoE theme to a ggplot2 plot
#'
#' @export
theme_doe <- function(){

  check_font_families()

  font <- "Public Sans" # set font family first
  theme_minimal() %+replace% # replace elements we want to change
    theme(

      #text elements
      text = element_text(family = font,
                          size = 16,
                          color = "grey30"),

      #grid elements
      panel.grid.minor.y = element_blank(),
      panel.grid.minor.x = element_blank(),

      #legend elements  (may be better to do in individual plots)
      legend.position = "bottom",
      legend.text = element_text(size = rel(0.7)),
      legend.title = element_text(size = rel(0.7))
    )
}
