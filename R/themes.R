#' Apply the DoE theme to a ggplot2 plot
#'
#' @param base_size base font size, given in pts.
#' @param ... arguments passed to theme_minimal
#'
#' @export
theme_doe <- function(base_size = 12, ...){
  ggplot2::theme_minimal(base_size = base_size, ...) %+replace%
    ggplot2::theme(
      panel.grid.major.x = element_blank(),
      panel.grid.minor = element_blank(),
      complete = TRUE
    )
}
