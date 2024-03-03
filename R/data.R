#' Colours provided by `doestyle`
#'
#' A dataset containing names, hex and RGB values, and other identifiers for
#' each colour provided in `doestyle`. Its content can be visualised with
#' [show_colours()] or further manipulated.
#'
#' @seealso [show_colours()]
#'
#' @source - [NSW Design
#'   System](https://github.com/digitalnsw/nsw-design-system/blob/deab23d17f68c799a669d3ee6d6089d9a8ff8a76/src/core/colour/json/palettes.json)
#'  - Department of Education [Brand guidelines](https://brand.education.nsw.gov.au/)
"colourdata"

#' Palettes provided by `doestyle`
#'
#' A list of palettes, organised by type.
#'
#' - Qualitative: designed to show differences between nominal classes
#' - Sequential: designed to show differences in ordered data that progress in
#'    value from low to high (or vice versa)
#' - Diverging: designed to show differences in ordered data that progress away
#'    from a central value to extremes at either end of a scale
#'
#' Palettes can be accessed by their type and name.
#' @examples
#' doe_palettes$default
#' doe_palettes$seq.blues
#'
#' # List palettes and their colours
#' print(doe_palettes)
#'
#' # Visualise palettes
#' plot(doe_palettes)
"doe_palettes"
