# Tests for colour names

test_that("get_colours requires at least one colour_name", {
  expect_error({get_colours()})
})

test_that("get_colours fails if given only non-doestyle colour names", {
  expect_error({get_colours("coquelicot")})
})

test_that("get_colours fails if given a mix of doestyle and non-doestyle names", {
  expect_error({get_colours("blue-01", "red-02", "coquelicot")})
  expect_error({get_colours(c("blue-01", "red-02", "coquelicot"))})
})

test_that("get_colours succeeds for all doestyle colour names", {
  expect_no_condition({get_colours(colourdata$colour_name)})
})

test_that("colour names survive a round trip to hex values", {
  expect_equal(get_colour_names(get_colours(colourdata$colour_name)),
               expected = colourdata$colour_name)
})

test_that("explicitly named arguments to get_colours are preserved", {
  expect_named({get_colours("Name A" = "blue-01", "Name B" = "red-02")},
               expected = c("Name A", "Name B"))
  expect_named({get_colours(c("Name A" = "red-01", "Name B" = "red-04"))})
  expect_named({get_colours("red-04", "grey-01")},
               expected = NULL)
  expect_warning({get_colours("Name A" = "blue-02", "red-01")})
})

# Tests for hex values

test_that("get_colour_names requires at least one hex value", {
  expect_error({get_colour_names()})
})

test_that("get_colour_names fails if given only non-doestyle hex values", {
  expect_error({get_colour_names("#a92e28", "#cf3831", "#041e42")})
  expect_error({get_colour_names(c("#a92e28", "#cf3831", "#041e42"))})
})

test_that(
  "get_colour_names fails if given a mix of doestyle and non-doestyle hex values",
  {
    expect_error({get_colour_names("#002664", "#a92e28", "#cf3831", "#041e42")})
    expect_error({get_colour_names(c("#002664", "#a92e28", "#cf3831", "#041e42"))})
  }
)

test_that("get_colour_names succeeds for all doestyle hex values", {
  expect_no_condition({get_colour_names(colourdata$hex_value)})
})

test_that("hex values survive a round trip to colour names", {
  expect_equal(get_colours(get_colour_names(colourdata$hex_value)),
               expected = colourdata$hex_value)
})

test_that("get_colour_names accepts a mix of hex formats", {
  expect_equal(get_colour_names("002664", "#146cfd", "#22272B", "D7153A"),
               expected = c("blue-01", "blue-02", "grey-01", "red-02"))
})
