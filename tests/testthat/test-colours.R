test_that("get_hex requires at least one colour_name", {
  expect_error({get_hex()})
})

test_that("get_hex fails if given only non-doestyle colour names", {
  expect_error({get_hex("coquelicot")})
})

test_that("get_hex fails if given a mix of doestyle and non-doestyle names", {
  expect_error({get_hex("blue-01", "red-02", "coquelicot")})
})

