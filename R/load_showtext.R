#' Import showtext to make use of DoE fonts
#'
#' @export
check_font_families <- function() {
  if (!suppressWarnings(any(file.exists(sysfonts::font_paths("Public Sans"))))) {
    glue::glue_col("The font {underline Public Sans} is not installed in any of the search paths.
  Please download the fonts from {blue https://fonts.google.com/specimen/Public+Sans}
  And then install the fonts, following the instructions here:
  {blue https://support.microsoft.com/en-us/windows/how-to-install-or-remove-a-font-in-windows-f12d0657-2fc8-7613-c76f-88d043b334b8#ID0EDH}
  \n\n
  ", .literal = TRUE)
  }

  if ((.Platform$OS.type == "windows") & (!"Public Sans" %in% sysfonts::font_families())) {
    sysfonts::font_add("Public Sans",
      regular = "PublicSans-Regular.ttf",
      bold = "PublicSans-Bold.ttf",
      italic = "PublicSans-Italic.ttf",
      bolditalic = "PublicSans-BoldItalic.ttf"
    )
    # font.families()
  }

  # set showtext_auto()  ----------------------------------------------------
  showtext::showtext_auto() # call once so any newly opened graphics device uses showtext to draw text
}
