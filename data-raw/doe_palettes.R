## code to prepare `doe_palettes` dataset

library(doestyle)
library(palettes)

# Discrete  palettes ------------------------------------------------------

qualitative <- palettes::pal_palette(
  default = get_colours("blue-01",
                        "red-02",
                        "blue-03",
                        "red-03",
                        "blue-02",
                        "red-01")
)

sequential <- palettes::pal_palette(
  blues = get_colours(paste0("blue-0", 4:1)),
  reds = get_colours(paste0("red-0", 4:1)),
  greys = get_colours(paste0("grey-0", 4:1)),
)

diverging <- palettes::pal_palette(
  red_blue = get_colours(paste0("red-0", 1:4),
                         "grey-04",
                         paste0("blue-0", 4:1))
)

doe_palettes <- list(
  qualitative = qualitative,
  sequential = sequential,
  diverging = diverging
)

usethis::use_data(doe_palettes, overwrite = TRUE)
