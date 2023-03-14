#' Apply the DoE colour palette to the fill aesthetic
#'
#' @param ...
#' @param aesthetics
#'
#' @export
scale_fill_doe <- function(..., aesthetics = "fill"){
  discrete_scale(
    aesthetics = aesthetics,
    scale_name = "doe",
    palette = doe_pal
  )
}

#' Apply the DoE colour palette to the colour aesthetic
#'
#' @param ...
#' @param aesthetics
#'
#' @export
scale_colour_doe <- function(..., aesthetics = "colour") {
  discrete_scale(
    aesthetics = aesthetics,
    scale_name = "doe",
    palette = doe_pal
  )
}
