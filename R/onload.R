.onAttach <- function(...) {
  ## Register desired system fonts

  message("registering fonts...")
  fonts <- systemfonts::system_fonts()

  try(init_fonts(fonts), outFile = "Could not register required fonts, please download and install from: https://agrilife.tamu.edu/wp-content/uploads/2021/03/AgriFonts.zip")
}


.onLoad <- function(...){
  cowplot::set_null_device("agg")

}
