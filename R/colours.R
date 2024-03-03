# Functions for working with NSW and DoE named colours

# Named character vector with every defined NSW colour. See
# data-raw/colourdata.R to update if needed when the brand changes.
data("colourdata")
doestyle_cols <- with(colourdata,
                      purrr::set_names(hex_value,
                                       colour_name))

#' Get brand colours by name
#'
#' @param ... Colour name(s). May be supplied as a character vector or as
#'   individual arguments.
#'
#' @return `get_colours()` returns a character vector containing the hex values
#'   for each requested brand colour.
#' @export
#'
#' @details `get_colours()` will only return hex values for valid NSW and
#'   Department of Education colour names. To list available colours, use
#'   [list_doestyle_colours()]. To plot available colours, use [show_colours()].
#'
#' @examples
#' get_colours("blue-01", "red-02", "blue-04")
#' get_colours(c("red-01", "red-02", "red-03", "red-04"))
get_colours <- function(...) {
  colour_names <- c(...)
  if (is.null(colour_names)) {
    cli::cli_abort(c(
      "x" = "At least one colour name must be supplied to {.code get_colours()}"))
  }

  check_colour_names(colour_names)
  doestyle_cols[colour_names]
}

#  Aliases for get_colours

#' @rdname get_colours
#' @export
doe_colours <- get_colours

#' @rdname get_colours
#' @export
doe_cols <- get_colours

#' List valid NSW or DoE colours and their hex values
#'
#' @return A tibble containing the names of valid colours and their hex values.
#' @export
#'
#' @examples
#' list_doestyle_colours()
#' list_doestyle_colours() |> print(n = 50)
list_doestyle_colours <- function() {
  colourdata |>
    dplyr::select(colour_name, hex_value) |>
    dplyr::mutate(hex_value = palettes::pal_colour(hex_value))
}

#' Test whether given colour names are in the brand colour list
#'
#' @param colour_names A character vector of colour name(s).
#'
#' @return A logical vector.
is_doestyle_colour_name <- function(colour_names) {
  colour_names %in% names(doestyle_cols)
}

#' Abort if provided with invalid colour names
#'
#' `check_colour_names()` will throw an informative error if provided with
#' colour names that do not exist in the brand colour list.
#'
#' @param colour_names A character vector of colour name(s).
check_colour_names <- function(colour_names) {
  # Does colour_names contain only valid doestyle colour names?
  colours_ok <- is_doestyle_colour_name(colour_names)

  if (any(!colours_ok)) {
    non_cols <- colour_names[!colours_ok]
    cli::cli_abort(c(
      "x" = "The following colour name{?s} {?is not a/are not} valid doestyle
      colour{?s}: {non_cols}",
      "i" = "Run {.run doestyle::list_doestyle_colours()} or
      {.run doestyle::show_colours(\"all\")} to list or plot all `doestyle`
      colour names."
    ))
  }
}
