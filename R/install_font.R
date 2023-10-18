#' Open and install fonts
#'
#' Helper function to open font folders in your GUI so you can install fonts
#' for local use.
#' @param font one of `c("CrimsonPro","OpenSansCondensed")`
#'
#' @return Hopefully nothing
#' @export
#'
#' @examples
#' install_font("CrimsonPro")
install_font <- function(font) {
  ## check valid font names
  font_names <- c("CrimsonPro", "OpenSansCondensed")
  if(!(font %in% font_names)) stop("The font argument must be one of ",
                                   paste(font_names, collapse = ", "))

  ##get file path
  font_path <- system.file("fonts", font, package = "twriTemplates")
  message(font_path)
  ## windows
  if(.Platform$OS.type == "windows") {
    out <- try(shell.exec(font_path))
  } else if(Sys.info()["sysname"] == "Darwin") {
    ## not 100% sure this works, don't have mac to try
    font_path <- paste0("open ", font_path)
    out <- try(system(font_path, wait = FALSE))
  } else if(Sys.info()["sys.name"] == "unix") {
    ## untested
    font_path <- paste0("xdg-open ", font_path)
    out <- try(system(font_path, wait = FALSE))
  }
  return(invisible(out))
}
