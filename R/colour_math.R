#' Compute the contrast ratio between pairs of colours
#'
#' Compute contrast ratios between pairs of colours, using the WCAG 2.1 formula.
#'
#' Contrast ratio is [defined](https://www.w3.org/TR/WCAG21/#dfn-contrast-ratio)
#' as \eqn{\frac{L_1 + 0.05}{L_2 + 0.05}} where \eqn{L_1} and \eqn{L_2} are the
#' [relative luminances](https://www.w3.org/TR/WCAG21/#dfn-relative-luminance)
#' of the lighter and darker colours being compared.
#'
#' Contrast ratios range from 1 (no colour contrast) to 21 (maximum contrast).
#' To meet [WCAG 2.1 _minimum_ (AA) criteria for
#' accessibility](https://www.w3.org/TR/WCAG21/#contrast-minimum), the contrast
#' ratios between adjacent colours must be:
#'
#' - For text, at least 4.5
#' - For large text (18pt or larger, or 14pt bold), at least 3
#' - For non-text plot elements (e.g. patterns, lines, points, borders etc.), at least 3
#'
#' To meet WCAG 2.1 enhanced (AAA) contrast requirements, generally a ratio
#' above 7 is required.
#'
#' See WCAG 2.1 success criteria [1.4.3 Contrast
#' (Minimum)](https://www.w3.org/TR/WCAG21/#contrast-minimum), [1.4.6 Contrast
#' (Enhanced)](https://www.w3.org/TR/WCAG21/#contrast-enhanced) and [1.4.11
#' Non-text Contrast](https://www.w3.org/TR/WCAG21/#non-text-contrast).
#'
#' @param colour1,colour2 Character vectors of hexadecimal colour values.
#'
#' @returns `contrast_ratio()` returns a numeric vector of contrast ratios, of
#'   the same length as `colour1` and `colour2`.
#' @export
#'
#' @examples
#' backgrounds <- doe_cols("white", "black", "blue-01", "grey-04", "black")
#' foregrounds <- doe_cols("black", "white", "blue-03", "grey-03", "black")
#'
#' contrast_ratio(colour1 = backgrounds, colour2 = foregrounds)
contrast_ratio <- function(colour1, colour2) {
  l1 <- relative_luminance(colour1)
  l2 <- relative_luminance(colour2)
  ratio <- (l1 + 0.05) / (l2 + 0.05)

  ifelse(l1 > l2,
         ratio,
         1 / ratio)
}

#' Compute the relative luminance of an sRGB colour
#'
#' Compute the relative luminance of sRGB colour(s). See [WCAG 2.1 definition:
#' relative luminance](https://www.w3.org/TR/WCAG21/#dfn-relative-luminance).
#'
#' @param hex_values A character vector of hex value(s).
#'
#' @returns `relative_luminance()` returns a numeric vector of luminance values.
#' @export
#'
#' @examples
#' relative_luminance(c("#ffffff", "#000000", "#002664", "#d7153a"))
#' relative_luminance(doe_cols("white", "black", "blue-01", "red-02"))
relative_luminance <- function(hex_values) {
  validate_hex(hex_values)

  # Use the WCAG2.1 formula for relative luminance:
  # https://www.w3.org/TR/WCAG21/#dfn-relative-luminance
  rgb_scaled <- grDevices::col2rgb(hex_values) / 255
  rgb_clamp <- ifelse(rgb_scaled <= 0.04045,
                      rgb_scaled / 12.92,
                      ((rgb_scaled + 0.055) / 1.055)^2.4)

  as.vector(c(0.2126, 0.7152, 0.0722) %*% rgb_clamp)
}
