test_that("theme_doe_flextable produces consistent HTML output", {
  expect_snapshot({
    head(mtcars) |>
      flextable::flextable() |>
      theme_doe_flextable() |>
      officer::to_html() |>
      # Strip UUID-containing class names
      gsub("cl-[0-9a-f]{8}", "", x = _ ) |>
      gsub("font-family:'.+?'", "", x = _)
  })
})
