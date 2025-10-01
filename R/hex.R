#' Test whether given hex values are in the brand colour list
#'
#' @param hex_values A character vector of hex value(s).
#'
#' @return A logical vector.
#' @noRd
is_doestyle_hex_value <- function(hex_values) {
  hex_values %in% doestyle_cols()
}

#' Test whether a given string can be interpreted as a hex value
#'
#' @inheritParams is_doestyle_hex_value
#' @noRd
is_hex_value <- function(hex_values) {
  grepl("^#([0-9a-fA-F]{2}){3,4}$", hex_values)
}

#' Abort if provided with hex values that aren't in doestyle::colourdata
#'
#' `check_hex_values()` will throw an informative error if provided with
#' hex values that do not exist in the brand colour list.
#'
#' @inheritParams is_doestyle_hex_value
#' @noRd
check_hex_values <- function(hex_values) {
  validate_hex(hex_values)

  # Does hex_values contain only valid doestyle colours?
  hex_ok <- is_doestyle_hex_value(hex_values)

  if (any(!hex_ok)) {
    non_hex <- hex_values[!hex_ok]
    cli::cli_abort(c(
      "x" = "The following hex value{?s} {?is not a/are not} valid doestyle
      colour{?s}: {non_hex}",
      "i" = "Run {.run doestyle::list_doestyle_colours()} to list or all
      `doestyle` colour names and hex values."
    ))
  }
}

#' Abort if provided with strings that aren't interpretable as hex
#'
#'
#' @inheritParams is_doestyle_hex_value
#' @noRd
validate_hex <- function(hex_values) {
  # Does hex_values contain only valid hex?
  hex_valid <- is_hex_value(hex_values)

  if (any(!hex_valid)) {
    invalid_hex <- hex_values[!hex_valid]
    cli::cli_abort(c(
      "x" = "The following string{?s} {?is not a/are not} valid hexidecimal
      colour{?s}: {invalid_hex}"
    ))
  }
}

#' Standardise hex values prior to lookups
#'
#' @inheritParams is_doestyle_hex_value
#' @noRd
std_hex <- function(hex_values) {
  # Our hex values should always be lower case
  hex_values <- tolower(hex_values)
  # Our doestyle hex values should start with a hash
  dplyr::if_else(grepl("^#", hex_values),
                 hex_values,
                 paste0("#", hex_values)) |>
    palettes::pal_color()
}
