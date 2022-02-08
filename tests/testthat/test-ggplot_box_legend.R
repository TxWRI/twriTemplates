test_that("ggplot_box_legend", {
  x <- ggplot_box_legend()
  testthat::expect_s3_class(x, "ggplot")
})
