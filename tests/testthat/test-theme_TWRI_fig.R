library(ggplot2)
test_that("theme_TWRI_fig", {
  x <- ggplot(Dissolved_Oxygen) +
    geom_point(aes(Date, Min_DO)) +
    theme_TWRI_fig()
  testthat::expect_s3_class(x, "ggplot")
})

