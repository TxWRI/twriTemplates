#' Get file path to example data
#'
#' twriTemplates comes with five bundled  example data files in its
#' `inst/extdata` directory. This function makes them easy to access for
#' practice reading with [read.csv()] or [readr::read_csv()].
#'
#' @param file Name of the file in quotes with extension; `"arroyo_swqm.txt"`,
#'   `"dissolved_oxygen_raw.csv"`, `"easterwood.csv"`, `"marabwq2021.csv"`, or
#'   `"marcewq2021.csv"` will work. If `NULL`, the example files will be listed.
#'
#' @return file path
#' @export
#'
#' @examples
#' path_to_file()
#' path_to_file("easterwood.csv")
#' head(read.csv(path_to_file("easterwood.csv")))
#' @source This function is adapted from `readxl::readxl_example()`
path_to_file <- function(file = NULL) {
  if (is.null(file)) {
    dir(system.file("extdata", package = "twriTemplates"))
  } else {
    system.file("extdata", file, package = "twriTemplates", mustWork = TRUE)
  }
}
