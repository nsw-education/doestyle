#' DoE colour palette
#'
#' @param n
#'
#' @return a character vector of hexadecimal colour codes, with length n
#' @export
doe_pal <- function(n) {
  c(
    "#002664", # Navy
    "#D7153A", # Red
    "#CBEDFD", # Light Blue
    "#FFB8C1", # Pink
    "#407EC9", # Medium Blue 1
    "#EBEBEB", # Light Grey
    "#6CACE4", # Medium Blue 2
    "#FFFFFF" # White
  )[1:n]
}
