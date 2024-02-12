# Prepare colourdata dataset

library(tidyverse)
library(jsonlite)
library(palettes)

# NSW Design System palette -----------------------------------------------

# NSW Design System palette sourced from DigitalNSW repo:
# https://github.com/digitalnsw/nsw-design-system/
# See https://github.com/digitalnsw/nsw-design-system/blob/deab23d17f68c799a669d3ee6d6089d9a8ff8a76/src/core/colour/json/palettes.json

nswpal_raw <- read_json("data-raw/palettes.json") |>
  pluck("palettes")

nswpal <- tibble(
  colour_name = names(nswpal_raw),
  hex_value = as.character(nswpal_raw)) |>
  mutate(
    family = str_extract(colour_name, "^[[:alpha:]]+"),
    tone = str_extract(colour_name, "(?<=-)[[:digit:]]+?$"),
    nsw_brand = TRUE
  )

# Department of Education additions ---------------------------------------

# Additional DoE colours, sourced from the current (Nov 2022) Brand Guidelines,
# page 77. These are currently only used in theme_doe_flextable(), and are not
# part of the DoE brand.
# https://brand.education.nsw.gov.au/

doe_extra <- read_csv("data-raw/doe-auxillary.csv") |>
  mutate(doe_auxillary = TRUE)

# Collated doestyle colourdata --------------------------------------------

# DoE brand and primary colour names, from Brand guidelines pages 26-27.
# https://brand.education.nsw.gov.au/

doe_brand <- expand_grid(c("blue", "red", "grey"),
                         c("01", "02", "03", "04")) |>
  pmap_chr(~paste(..., sep = "-")) |>
  append("white")
doe_primary <- c("blue-01", "red-02", "blue-04", "white")

colourdata <- bind_rows(nswpal, doe_extra) |>
  mutate(
    hex_value = set_names(pal_color(hex_value),
                          colour_name),
    doe_brand = colour_name %in% doe_brand,
    doe_primary = colour_name %in% doe_primary,
    as_tibble(`colnames<-`(t(col2rgb(hex_value)),
                           c("red", "green", "blue"))),
    across(where(is_logical), ~replace_na(.x, FALSE)))

usethis::use_data(colourdata, overwrite = TRUE)
