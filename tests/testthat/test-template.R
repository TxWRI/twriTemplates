

expect_knit <- function(template){
  expect_output(
    expect_message(
      rmarkdown::render(
        system.file("rmarkdown", "templates", template, "skeleton", "skeleton.Rmd", package = "twriTemplates"),
        output_file = sprintf("%s-test", template),
        output_dir = file.path(getwd(), "rendered")),
      "Output created"),
    "pandoc")
}

test_that("twri-docx", {
  skip_on_cran()
  expect_knit("twri-docx")
})

test_that("twri-pdf", {
  skip_on_cran()
  expect_knit("twri-pdf")
})




test_that("twri-docx returns rmarkdown class", {
  skip_on_cran()
  expect_s3_class(twri_docx(), "rmarkdown_output_format")
})

test_that("twri-pdf returns rmarkdown class", {
  skip_on_cran()
  expect_s3_class(twri_pdf(), "rmarkdown_output_format")
})
