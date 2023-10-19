test_that("install_font_works", {
  testthat::expect_error(install_font("CrimsonPros"))
  ## platform dependent results
  ## on windows returns invisible null
  ## on macos and linux shold return 0
  testthat::skip_on_os(c("mac", "linux", "solaris"))
  testthat::expect_null(install_font("CrimsonPro"))

  testthat::skip_on_os(c("windows", "solaris"))
  testthat::expect_equal(install_font("CrimsonPro"), 0)
})
