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
    try(shell.exec(font_path))
  } else if(Sys.info()["sysname"] == "Darwin") {
    ## not 100% sure this works, don't have mac to try
    open_font_path <- paste0("open ", font_path)
    try(system(open_font_path, wait = FALSE))
  } else if(grepl("linux-gnu", R.version$os)) {
    ## untested
    xdg_open_font_path <- paste0("xdg-open ", font_path)
    x <- try(system(xdg_open_font_path, wait = FALSE),
        silent = TRUE)
    if(is(x, "try-error")) {
      message("install fonts from", paste0(font_path))
      return(invisible(NULL))
    } else {return(x)}
  }
}
