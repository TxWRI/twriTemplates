test_that("path_to_file works", {
  testthat::expect_vector(path_to_file(),
                          character(),
                          size = 5)

  testthat::expect_vector(path_to_file("arroyo_swqm.txt"),
                          character(),
                          size = 1)

  testthat::expect_error(path_to_file("fake.txt"))
})
