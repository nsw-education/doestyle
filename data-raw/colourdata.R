# Prepare colourdata dataset

library(tidyverse)
library(jsonlite)

# NSW Design System palette sourced from DigitalNSW repo:
# https://github.com/digitalnsw/nsw-design-system/
# See https://github.com/digitalnsw/nsw-design-system/blob/deab23d17f68c799a669d3ee6d6089d9a8ff8a76/src/core/colour/json/palettes.json

nswpal_raw <- read_json("data-raw/palettes.json") |>
  pluck("palettes")

nswpal <- tibble(
  colour_name = names(nswpal_raw),
  hex_value = as.character(nswpal_raw)) |>
  mutate(
    family = str_extract(colour_name, "^[[:alpha:]]+?(?=-)"),
    tone = str_extract(colour_name, "(?<=-)[[:digit:]]+?$"),
    nsw_brand = TRUE
  )

# usethis::use_data(colourdata, overwrite = TRUE)
