test_that("doe_pal() defaults yield primary brand colours",
          {expect_in(doe_pal()(2), c("#002664", "#D7153A"))}
)
