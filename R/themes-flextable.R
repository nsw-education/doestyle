#' The DoE flextable theme
#'
#' Apply a DoE brand-compliant theme to a flextable object.
#'
#' @param x a flextable object
#'
#' @export
#'
#' @examples
#' head(mtcars) |>
#'   flextable::flextable() |>
#'   theme_doe_flextable()
theme_doe_flextable <- function(x){
  x_flex <- x |>
    # Match DoE Word table style
    flextable::bold(part = "header") |>
    # Row heights are 30px ~ 8mm
    flextable::height_all(height = 8,
                          part = "all",
                          unit = "mm") |>
    flextable::color(color = get_colours("blue-01"),
                     part = "header") |>

    # Apply the flextable zebra theme, first row transparent as per DoE brand
    # guidelines (for tables with 5 or more rows)
    flextable::theme_zebra(
      odd_header = "transparent",
      odd_body = "transparent",
      even_header = "transparent",
      even_body = get_colours("off-white")) |> # See Brand guidelines p.77
    flextable::line_spacing(space = 1, part = "all") |>
    flextable::hline_top(part = "body",
                         border = officer::fp_border(
                           color = get_colours("red-02"),
                           width = 2,
                           style = "solid"))

    # Sorcery from
    # https://www.r-bloggers.com/2022/09/word-up-notes-on-working-with-officer-officedown-and-flextable-to-generate-word-documents-in-rmarkdown/
    # This width statement has the effect of stretching the table across an A4
    # page width (within margins) - works well with both Word and PDF and
    # results in "nice" column widths, for both column headers and cell contents
    flextable::width(x_flex, width = dim(x_flex)$widths * 6.5 /
                       (flextable::flextable_dim(x_flex)$widths))
}

#' @rdname theme_doe_flextable
apply_DoE_zebra_format <- theme_doe_flextable
