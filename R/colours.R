# Functions for working with doestyle colours

# Named character vector with every defined doestyle colour. See
# data-raw/colourdata.R to update if needed when the brand changes.
data("colourdata")
doestyle_cols <- with(colourdata,
                      purrr::set_names(hex_value,
                                       colour_name))

get_hex <- function(...) {
  cols <- c(...)
  check_colour_names(cols)
  doestyle_cols[cols]
}

is_doestyle_colour_name <- function(colour_names) {
  colour_names %in% names(doestyle_cols)
}

check_colour_names <- function(colour_names) {
  # Does colour_names contain only valid doestyle colour names?
  colours_ok <- is_doestyle_colour_name(colour_names)

  if (any(!colours_ok)) {
    non_cols <- colour_names[!colours_ok]
    cli::cli_abort(c(
      "x" = "The following colour name{?s} {?is not a/are not} valid doestyle
      colour{?s}: {non_cols}",
      "i" = "Run {.run doestyle::doestyle_colours()} or
      {.run doestyle::show_colours(\"all\")} to list or plot all `doestyle`
      colour names."
    ))
  }
}

doestyle_colours <- function() {
  colourdata |>
    dplyr::select(colour_name, hex_value) |>
    dplyr::mutate(hex_value = palettes::pal_colour(hex_value))
}
