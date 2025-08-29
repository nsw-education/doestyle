#' Add an up errorbar to a ggplot2 plot
#'
#' Add the upper portion of an errorbar to a ggplot plot. This
#' allows the halves of the errorbars to be different colours.
#' @inheritParams ggplot2::geom_errorbar
#' @param ... Other parameters passed to [ggplot2::geom_errorbar()].
#'
#' @examples
#' library(doestyle)
#' library(ggplot2)
#'
#' df <- data.frame(
#'   observation = c("A", "B", "C"),
#'   lower = c(1, 2, 3),
#'   estimate = c(2, 4, 4),
#'   upper = c(3, 6, 5)
#' )
#'
#' ggplot(df, aes(x = observation,
#'                y = estimate,
#'                ymin = lower,
#'                ymax = upper)) +
#'   geom_col() +
#'   geom_uperrorbar(width = 1/10) +
#'   geom_downerrorbar(width = 1/10,
#'                     colour = "white")
#' @export

## With thanks to Sean Hughes: https://stackoverflow.com/questions/27585776/error-bars-for-barplot-only-in-one-direction

# Define a new geom for upward error bars
geom_uperrorbar <- function(mapping = NULL, data = NULL,
                            stat = "identity", position = "identity",
                            ...,
                            na.rm = FALSE,
                            show.legend = NA,
                            inherit.aes = TRUE) {
  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomUperrorbar,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}

GeomUperrorbar <- ggproto("GeomUperrorbar", Geom,
                          default_aes = aes(colour = "black", linewidth = 0.5, linetype = 1, width = 0.5,
                                            alpha = NA),

                          draw_key = draw_key_path,
                          required_aes = c("x", "y", "ymax"),

                          setup_data = function(data, params) {
                            data$width <- data$width %||%
                              params$width %||% (resolution(data$x, FALSE) * 0.9)

                            transform(data,
                                      xmin = x - width / 2, xmax = x + width / 2, width = NULL
                            )
                          },

                          draw_panel = function(data, panel_scales, coord, width = NULL) {
                            GeomPath$draw_panel(data.frame(
                              x = as.vector(rbind(data$xmin, data$xmax, NA, data$x,   data$x)),
                              y = as.vector(rbind(data$ymax, data$ymax, NA, data$ymax, data$y)),
                              colour = rep(data$colour, each = 5),
                              alpha = rep(data$alpha, each = 5),
                              linewidth = rep(data$linewidth, each = 5),
                              linetype = rep(data$linetype, each = 5),
                              group = rep(1:(nrow(data)), each = 5),
                              stringsAsFactors = FALSE,
                              row.names = 1:(nrow(data) * 5)
                            ), panel_scales, coord)
                          }
)

#' Add a down errorbar to a ggplot2 plot
#'
#' Add the lower portion of an errorbar to a ggplot plot. This
#' allows the halves of the errorbars to be different colours.
#' @inheritParams ggplot2::geom_errorbar
#' @inherit geom_uperrorbar examples
#' @param ... Other parameters passed to [ggplot2::geom_errorbar()].
#'
#' @export
# Define a new geom for downward error bars
geom_downerrorbar <- function(mapping = NULL, data = NULL,
                              stat = "identity", position = "identity",
                              ...,
                              na.rm = FALSE,
                              show.legend = NA,
                              inherit.aes = TRUE) {
  layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = GeomDownerrorbar,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}

GeomDownerrorbar <- ggproto("GeomDownerrorbar", Geom,
                            default_aes = aes(colour = "black", linewidth = 0.5, linetype = 1, width = 0.5,
                                              alpha = NA),

                            draw_key = draw_key_path,

                            required_aes = c("x", "y", "ymin"),

                            setup_data = function(data, params) {
                              data$width <- data$width %||%
                                params$width %||% (resolution(data$x, FALSE) * 0.9)

                              transform(data,
                                        xmin = x - width / 2, xmax = x + width / 2, width = NULL
                              )
                            },

                            draw_panel = function(data, panel_scales, coord, width = NULL) {
                              GeomPath$draw_panel(data.frame(
                                x = as.vector(rbind(data$xmin, data$xmax, NA, data$x,   data$x)),
                                y = as.vector(rbind(data$ymin, data$ymin, NA, data$ymin, data$y)),
                                colour = rep(data$colour, each = 5),
                                alpha = rep(data$alpha, each = 5),
                                linewidth = rep(data$linewidth, each = 5),
                                linetype = rep(data$linetype, each = 5),
                                group = rep(1:(nrow(data)), each = 5),
                                stringsAsFactors = FALSE,
                                row.names = 1:(nrow(data) * 5)
                              ), panel_scales, coord)
                            }
)
