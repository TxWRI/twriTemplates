test_that("theme_TWRI_pres", {
  x <- ggplot(Dissolved_Oxygen) +
    geom_point(aes(Date, Min_DO)) +
    theme_TWRI_pres()
  testthat::expect_s3_class(x, "ggplot")
})
