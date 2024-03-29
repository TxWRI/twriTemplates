.onAttach <- function(...) {

  packageStartupMessage("See https://github.com/TxWRI/twriTemplates for more details, use the Issues tab if you have questions.")
}


.onLoad <- function(...){# nocov start
  ## Use agg here to prevent error messages in add_TWRI_logo
  ## in general, encourage users to utilize ragg package to
  ## maximize export quality.
  cowplot::set_null_device("agg")

  ## Register desired system fonts
  fonts <- systemfonts::system_fonts()
  try(init_fonts(fonts))
  # nocov end
}
