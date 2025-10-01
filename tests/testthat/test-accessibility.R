# Tests to ensure that changes to doestyle colour combinations do not reduce
# accessibility

# All text-on-main contrast ratios should be at least 4.5
purrr::walk2(
  doe_colours(colourdata$colour_name),
  text_colours(colourdata$colour_name),
  function(main, text) {
    test_that(
      stringr::str_wrap(stringr::str_glue(
        "Main {main} ({doestyle:::get_colour_names(main)}) vs text {text}
        ({doestyle:::get_colour_names(text)}) contrast ratio is at least 4.5")),
      {
        expect_gte(contrast_ratio(main, text), 4.5)
      })
  }
)

# All main-on-secondary contrast ratios should be at least 3
purrr::walk2(
  doe_colours(colourdata$colour_name),
  secondary_colours(colourdata$colour_name),
  function(main, secondary) {
    test_that(
      stringr::str_wrap(stringr::str_glue(
        "Main {main} ({doestyle:::get_colour_names(main)}) vs secondary
        {secondary} ({doestyle:::get_colour_names(secondary)}) contrast ratio
        is at least 3")),
      {
        expect_gte(contrast_ratio(main, secondary), 3)
      })
  }
)
