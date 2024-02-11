test_that("show_colours() default has consistent ggplot output", {
  test_plot <- show_colours()
  vdiffr::expect_doppelganger("DoE brand swatch plot", test_plot)
})
