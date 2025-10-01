# Prepare colourdata dataset

library(readr)
library(dplyr)
library(purrr)
library(palettes)

# NSW Design System palette (palettes.json) sourced from DigitalNSW repo:
# https://github.com/digitalnsw/nsw-design-system/
# See https://github.com/digitalnsw/nsw-design-system/blob/deab23d17f68c799a669d3ee6d6089d9a8ff8a76/src/core/colour/json/palettes.json

# Auxillary DoE colours sourced from the current (Nov 2022) Brand Guidelines,
# page 77. These are currently only used in theme_doe_flextable(), and are not
# part of the main DoE brand.
# https://brand.education.nsw.gov.au/

# DoE brand and primary colour names come from from Brand guidelines pages
# 26-27. https://brand.education.nsw.gov.au/

colourdata <- read_csv("data-raw/colourdata.csv",
                       col_types = cols(
                         colour_name = col_character(),
                         hex_value = col_character(),
                         family = col_character(),
                         tone = col_integer(),
                         nsw_brand = col_logical(),
                         doe_auxillary = col_logical(),
                         doe_brand = col_logical(),
                         doe_primary = col_logical(),
                         secondary_colour = col_character(),
                         text_colour = col_character(),
                         red = col_integer(),
                         green = col_integer(),
                         blue = col_integer()
                       )) |>
  mutate(hex_value = set_names(palettes::pal_color(hex_value),
                               colour_name))

usethis::use_data(colourdata, overwrite = TRUE)
