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
#' # Examine one palette at a time
#' doe_palettes$default
#' doe_palettes$seq.blues
#'
#' # List all palettes and their colours
#' print(doe_palettes)
#'
#' # If you've loaded `palettes`, visualise the available palettes
#' library(palettes)
#' plot(doe_palettes)
"doe_palettes"

#' The New South Wales Education Public Schools Master Dataset
#'
#' The master dataset contains comprehensive information for all government schools in NSW. Data items include school locations, latitude and longitude coordinates, school type, student enrolment numbers, electorate information, contact details and more.
#' This dataset is publicly available through the [Data NSW website](https://data.nsw.gov.au/data/dataset/nsw-education-nsw-public-schools-master-dataset).
#'
#' @source <https://data.nsw.gov.au/data/dataset/nsw-education-nsw-public-schools-master-dataset>
"public_schools"
