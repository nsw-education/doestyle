# Functions for working with NSW and DoE named colours

# Return a named character vector with every defined NSW colour. See
# data-raw/colourdata.R to update if needed when the brand changes.
# This needs to be a function in order to access colourdata internally.
doestyle_cols <- function() {
  with(doestyle::colourdata,
       purrr::set_names(hex_value,
                        colour_name))
}

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
  doestyle_cols()[colour_names]
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
  doestyle::colourdata |>
    dplyr::select(colour_name, hex_value) |>
    dplyr::mutate(hex_value = palettes::pal_colour(hex_value))
}

#' Test whether given colour names are in the brand colour list
#'
#' @param colour_names A character vector of colour name(s).
#'
#' @return A logical vector.
#' @noRd
is_doestyle_colour_name <- function(colour_names) {
  colour_names %in% names(doestyle_cols())
}

#' Abort if provided with invalid colour names
#'
#' `check_colour_names()` will throw an informative error if provided with
#' colour names that do not exist in the brand colour list.
#'
#' @param colour_names A character vector of colour name(s).
#' @noRd
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

#' Get colour names by hex value
#'
#' @param ... Hex values. May be supplied as a character vector of hex values or
#'   as individual arguments.
#'
#' @return `get_colour_names()` returns a character vector of colour names.
#' @noRd
get_colour_names <- function(...) {
  if (is.null(c(...))) {
    cli::cli_abort(c(
      "x" = "At least one hex value must be supplied to {.code get_colour_names()}"))
  }

  hex_values <- std_hex(c(...))
  check_hex_values(hex_values)

  # Invert hex values and their names
  colour_names <- purrr::set_names(names(doestyle_cols()), doestyle_cols())
  unname(colour_names[hex_values])
  }

#' Get secondary colours for named brand colours
#'
#' Secondary colours are on-brand colours that can be used for pattern fills or
#' other visual elements that need contrast against an on-brand fill colour.
#' Each NSW Design System colour has a corresponding secondary colour available
#' via `secondary_colours()`.
#'
#' @param ... Colour name(s). May be supplied as a character vector or as
#'   individual arguments.
#'
#' @returns `secondary_colours()` returns the hex value of an appropriate
#'   secondary colour for each on-brand colour name supplied in its arguments.
#' @export
#'
#' @examples
#' secondary_colours("red-02", "blue-01", "blue-04")
secondary_colours <- function(...) {
  colour_names <- c(...)
  if (is.null(colour_names)) {
    cli::cli_abort(c(
      "x" = "At least one colour name must be supplied to {.code secondary()}"))
  }
  check_colour_names(colour_names)

  secondary_lookup <- purrr::set_names(doestyle::colourdata$secondary_colour,
                                       doestyle::colourdata$colour_name)

  secondary_lookup[colour_names] |>
    unname() |>
    get_colours()
}

#' Get text colours for named brand colours
#'
#' Text colours are designed for plotting text over an on-brand fill colour.
#' Each NSW Design System colour has a corresponding text colour available via
#' `text_colours()`.
#'
#' @param ... Colour name(s). May be supplied as a character vector or as
#'   individual arguments.
#'
#' @returns `secondary_colours()` returns the hex value of an appropriate text
#'   colour for each on-brand colour name supplied in its arguments.
#' @export
#'
#' @examples
#' text_colours("red-02", "blue-01", "blue-04")
text_colours <- function(...) {
  colour_names <- c(...)
  if (is.null(colour_names)) {
    cli::cli_abort(c(
      "x" = "At least one colour name must be supplied to {.code secondary()}"))
  }
  check_colour_names(colour_names)

  text_lookup <- purrr::set_names(doestyle::colourdata$text_colour,
                                  doestyle::colourdata$colour_name)

  text_lookup[colour_names] |>
    unname() |>
    get_colours()
}
