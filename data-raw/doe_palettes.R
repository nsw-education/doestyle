# Produces `doe_palettes` dataset

library(doestyle)
library(palettes)

qualitative <- palettes::pal_palette(
  doe = get_colours("blue-01",
                    "red-02",
                    "blue-03",
                    "red-03",
                    "grey-01",
                    "blue-02",
                    "red-01",
                    "grey-02",
                    "blue-04",
                    "red-04",
                    "grey-03",
                    "grey-04"),
)

sequential <- palettes::pal_palette(
  blues = get_colours("blue-04", "blue-03", "blue-02", "blue-01"),
  reds = get_colours("red-04", "red-03", "red-02", "red-01"),
  greys = get_colours("grey-04", "grey-03", "grey-02", "grey-01")
)

diverging <- palettes::pal_palette(
  red_blue = c(sequential$reds[4:2],
               get_colours("grey-04"),
               sequential$blues[2:4])
)

doe_palettes <- palettes::as_palette(c(
  default = list(qualitative$doe),
  qual = qualitative,
  seq = sequential,
  div = diverging
))

usethis::use_data(doe_palettes, overwrite = TRUE)
