init_fonts <- function(fonts) {

  ## make sure fonts are installed
  if(length(fonts[fonts$family == "Moriston Personal",]$path) == 0){
    packageStartupMessage("Moriston Personal font was not found,
                          please install from https://agrilife.tamu.edu/wp-content/uploads/2021/03/AgriFonts.zip")
  } else {
    ## register moriston fonts with systemfonts because styles are not defined by default
    MoristonRegular <- fonts[fonts$name == "MoristonPersonal-Medium",]$path
    MoristonSemibold <- fonts[fonts$name == "MoristonPersonal-Semibold",]$path
    systemfonts::register_font("Moriston_TWRI",
                               plain = MoristonRegular,
                               bold = MoristonSemibold,
                               features = systemfonts::font_feature(letters = ,
                                                                    numbers = c("lining")))
  }

  if(length(fonts[fonts$family == "Oswald",]$path) == 0){
    packageStartupMessage("Oswald font was not found,
                          please install from https://agrilife.tamu.edu/wp-content/uploads/2021/03/AgriFonts.zip")
  } else {
    Oswald_Bold <- fonts[fonts$name == "Oswald-SemiBold",]$path
    Oswald_Normal <- fonts[fonts$name == "Oswald-Light",]$path
    systemfonts::register_font("Oswald_TWRI",
                               plain = Oswald_Normal,
                               bold = Oswald_Bold,
                               )
    }


  if(length(fonts[fonts$family == "Minion Pro",]$path) == 0){
    packageStartupMessage("Minion Pro font was not found,
                          please install from https://agrilife.tamu.edu/wp-content/uploads/2021/03/AgriFonts.zip")
  }
  ## don't need to register minion pro

  ## register cabin
  OpenSansCondensed <- fs::path_package("twriTemplates", "fonts", "OpenSansCondensed", "OpenSansCondensed-Light.ttf")
  OpenSansCondensed_Bold <- fs::path_package("twriTemplates", "fonts", "OpenSansCondensed", "OpenSansCondensed-Bold.ttf")
  OpenSansCondensed_Italic <- fs::path_package("twriTemplates", "fonts", "OpenSansCondensed", "OpenSansCondensed-LightItalic.ttf")
  systemfonts::register_font("OpenSansCondensed_TWRI",
                             plain =  OpenSansCondensed,
                             bold =  OpenSansCondensed_Bold,
                             italic =  OpenSansCondensed_Italic)


}
