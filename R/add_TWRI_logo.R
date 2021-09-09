#' Add logo to ggplot
#'
#' @param plot ggplot object
#' @param scale scale the logo, defaults to 0.25
#' @param halign aligns logo within the ggplot [0-1]
#' @param valign aligns the logo within the ggplot [0-1]
#' @importFrom cowplot ggdraw draw_plot draw_image
#' @importFrom fs path_package
#' @return ggplot object
#' @export
#'
add_TWRI_logo <- function(plot,
                          scale = 0.25,
                          halign = 0.01,
                          valign = 0.01) {


  logo_path <- fs::path_package("twriTemplates", "rmarkdown", "templates", "twri-docx", "skeleton", "twri_logo.png")

  #logo <- magick::image_read_svg(logo_path, width = 2000)

  cowplot::ggdraw() +
    cowplot::draw_plot(plot) +
    cowplot::draw_image(logo_path,
                        x = 0,
                        y = 0,
                        scale = scale,
                        hjust = 0,
                        vjust = 0,
                        halign = halign,
                        valign = valign)

}
