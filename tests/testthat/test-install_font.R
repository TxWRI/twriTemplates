test_that("install_font_works", {
  testthat::expect_error(install_font("CrimsonPros"))
  testthat::expect_null(install_font("CrimsonPro"))
})
