init_fonts <- function(fonts) {
  MoristonRegular <- fonts[fonts$name == "MoristonPersonal-Medium",]$path
  MoristonSemibold <- fonts[fonts$name == "MoristonPersonal-Semibold",]$path
  systemfonts::register_font("Moriston_personal",
                             plain = MoristonRegular,
                             bold = MoristonSemibold,
                             features = systemfonts::font_feature(letters = ,
                                                                  numbers = c("lining","tabular")))
}
