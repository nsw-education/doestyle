#' Activate `showtext` and check for presence of Public Sans font family
#'
#' [theme_doe()] uses `showtext` to allow R graphics devices to render the
#' Public Sans font family. Use `check_font_families()` to check that Public
#' Sans is available and to activate `showtext`. If Public Sans is not installed
#' on the system or user font search paths, `doestyle`'s embedded copy of the
#' files will be used.
#'
#' @return `check_font_families()` does not have a return value and is called
#'   for its side effects.
#'
#' @seealso [showtext::showtext_auto()] and [Public
#'   Sans](https://digitalnsw.github.io/public-sans/).
#' @export
check_font_families <- function() {
  if ("Public Sans" %in% sysfonts::font_families()) {
    # Ensure any newly opened graphics device uses `showtext` to draw text
    showtext::showtext_auto()
  } else {
    # Do the required files and faces exist on the system font search path?
    fonts <- sysfonts::font_files()
    ps <- fonts[fonts$family == "Public Sans",]
    faces <- c(regular = "Regular",
               bold = "Bold",
               italic = "Regular Italic",
               bolditalic = "Bold Italic")

    if (all(faces %in% ps$face)) {
      # Register the system-installed Public Sans for use by showtext
      sysfonts::font_add(
        "Public Sans",
        regular = ps[[ps$face == faces$regular, file]],
        bold = ps[[ps$face == faces$bold, file]],
        italic = ps[[ps$face == faces$italic, file]],
        bolditalic = ps[[ps$face == faces$bolditalic, file]]
      )
    } else {
      # Use the copy of Public Sans included in doestyle
      sysfonts::font_add(
        "Public Sans",
        regular = public_sans_local()$regular,
        bold = public_sans_local()$bold,
        italic = public_sans_local()$italic,
        bolditalic = public_sans_local()$bolditalic)
    }
    showtext::showtext_auto()
  }
}

public_sans_local <- function() {
  ps <- system.file("fonts/public_sans", package = "doestyle")
  list(
    regular = paste0(ps, "/PublicSans-Regular.otf"),
    bold = paste0(ps, "/PublicSans-Bold.otf"),
    italic = paste0(ps, "/PublicSans-Italic.otf"),
    bolditalic = paste0(ps, "/PublicSans-BoldItalic.otf")
  )
}
