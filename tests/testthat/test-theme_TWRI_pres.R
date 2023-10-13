test_that("theme_TWRI_pres", {
  x <- ggplot(dissolved_oxygen) +
    geom_point(aes(end_date, min_do)) +
    theme_TWRI_pres()
  testthat::expect_s3_class(x, "ggplot")
})
