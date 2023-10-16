library(ggplot2)
test_that("theme_TWRI_print", {
  x <- ggplot(dissolved_oxygen) +
    geom_point(aes(end_date, min_do)) +
    theme_TWRI_print()
  testthat::expect_s3_class(x, "ggplot")
})

