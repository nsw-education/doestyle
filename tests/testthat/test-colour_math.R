# Tests for colour maths

test_that(
  "Contrast ratio between black and white is maximum: 21",
  {
    expect_equal(
      contrast_ratio(
        colour1 = doe_cols("black"),
        colour2 = doe_cols("white")
      ),
      21
    )
  }
)

test_that(
  "Contrast ratio is always computed with lighter over darker colour",
  {
    expect_equal(
      contrast_ratio(
        colour1 = doe_cols("black"),
        colour2 = doe_cols("white")
      ),
      contrast_ratio(
        colour1 = doe_cols("white"),
        colour2 = doe_cols("black")
      )
    )
  }
)

test_that(
  "Relative luminance for white and black are 1 and 0",
  {
    expect_equal(
      relative_luminance(doe_colours("white", "black")),
      c(1, 0)
    )
  }
)
