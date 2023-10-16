test_that("add_TWRI_logo", {
  x <- ggplot(dissolved_oxygen) +
    geom_point(aes(end_date, min_do))
  x <- add_TWRI_logo(x)
  testthat::expect_s3_class(x, "ggplot")
})
