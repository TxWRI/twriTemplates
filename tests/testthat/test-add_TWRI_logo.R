test_that("add_TWRI_logo", {
  x <- ggplot(Dissolved_Oxygen) +
    geom_point(aes(Date, Min_DO))
  x <- add_TWRI_logo(x)
  testthat::expect_s3_class(x, "ggplot")
})
