

#' Create a Boxplot Legend
#'
#' Create a legend that explains the features of a boxplot. Can be added easily
#' to existing ggplots using \code{\link[cowplot]{plot_grid}} or \code{\link[patchwork]{plot_arithmetic}}.
#' @param font_family defaults to \code{"OpenSansCondensed_TWRI"}. Can be
#'   modified to any locally installed font.
#' @param point_label character string - how you want to label to point in a
#'   legend. If you overlay measured points in the box plot, \code{" - Measured
#'   values"} is appropriate. If the points only indicate outliers, \code{" -
#'   values outside the\\ninterquartile range"} is appropriate. This can be
#'   custoimized as necessary. Use \code{"\\n"} to indicate where a line break
#'   should occur.
#'
#' @return a ggplot object
#' @import ggplot2
#' @importFrom stats quantile
#' @importFrom rlang .data
#' @export
#' @author Laura DeCicco
#' @references \url{https://waterdata.usgs.gov/blog/boxplots/}
#' @examples
#' library(ggplot2)
#' library(cowplot)
#' ggplot(Dissolved_Oxygen) +
#'   geom_boxplot(aes(as.factor(Station_ID),
#'                    Average_DO,
#'                    group = Station_ID)) +
#'   geom_jitter(aes(as.factor(Station_ID),
#'                   Average_DO,
#'                   group = Station_ID),
#'                width = 0.1, alpha = 0.25) +
#'  theme_TWRI_print() -> p1
#' file <- tempfile(fileext = '.png')
#' ragg::agg_png(file)
#' plot_grid(p1, ggplot_box_legend(), rel_widths = c(2,1))
#' dev.off()

ggplot_box_legend <- function(font_family = "OpenSansCondensed_TWRI",
                              point_label = " - Measured values"){

  ## function is originally from https://waterdata.usgs.gov/blog/boxplots/

  family <- font_family

  # Create data to use in the boxplot legend:
  set.seed(100)

  sample_df <- data.frame(parameter = "test",
                          values = sample(500))

  # Extend the top whisker a bit:
  sample_df$values[1:100] <- 701:800
  # Make sure there's only 1 lower outlier:
  sample_df$values[1] <- -350

  # Function to calculate important values:
  ggplot2_boxplot <- function(x){

    quartiles <- as.numeric(quantile(x,
                                     probs = c(0.25, 0.5, 0.75)))

    names(quartiles) <- c("25th percentile",
                          "50th percentile\n(median)",
                          "75th percentile")

    IQR <- diff(quartiles[c(1,3)])

    upper_whisker <- max(x[x < (quartiles[3] + 1.5 * IQR)])
    lower_whisker <- min(x[x > (quartiles[1] - 1.5 * IQR)])

    upper_dots <- x[x > (quartiles[3] + 1.5*IQR)]
    lower_dots <- x[x < (quartiles[1] - 1.5*IQR)]

    return(list("quartiles" = quartiles,
                "25th percentile" = as.numeric(quartiles[1]),
                "50th percentile\n(median)" = as.numeric(quartiles[2]),
                "75th percentile" = as.numeric(quartiles[3]),
                "IQR" = IQR,
                "upper_whisker" = upper_whisker,
                "lower_whisker" = lower_whisker,
                "upper_dots" = upper_dots,
                "lower_dots" = lower_dots))
  }

  # Get those values:
  ggplot_output <- ggplot2_boxplot(sample_df$values)

  # Lots of text in the legend, make it smaller and consistent font:
  update_geom_defaults("text",
                       list(size = 3,
                            hjust = 0,
                            family = family))
  # Labels don't inherit text:
  update_geom_defaults("label",
                       list(size = 3,
                            hjust = 0,
                            family = family))

  # Create the legend:
  # The main elements of the plot (the boxplot, error bars, and count)
  # are the easy part.
  # The text describing each of those takes a lot of fiddling to
  # get the location and style just right:
  explain_plot <- ggplot() +
    stat_boxplot(data = sample_df,
                 aes(x = .data$parameter, y=.data$values),
                 geom ='errorbar', width = 0) +
    geom_boxplot(data = sample_df,
                 aes(x = .data$parameter, y=.data$values),
                 width = 0.3, fill = "lightgrey") +
    theme_TWRI_print() +
    geom_segment(aes(x = 2.3, xend = 2.3,
                     y = ggplot_output[["25th percentile"]],
                     yend = ggplot_output[["75th percentile"]])) +
    geom_segment(aes(x = 1.2, xend = 2.3,
                     y = ggplot_output[["25th percentile"]],
                     yend = ggplot_output[["25th percentile"]])) +
    geom_segment(aes(x = 1.2, xend = 2.3,
                     y = ggplot_output[["75th percentile"]],
                     yend = ggplot_output[["75th percentile"]])) +
    geom_text(aes(x = 2.4, y = ggplot_output[["50th percentile\n(median)"]]),
              label = "Interquartile\nrange", fontface = "bold",
              vjust = 0.4) +
    geom_text(aes(x = c(1.17,1.17),
                  y = c(ggplot_output[["upper_whisker"]],
                        ggplot_output[["lower_whisker"]]),
                  label = c("Largest value within 1.5 times\ninterquartile range above\n75th percentile",
                            "Smallest value within 1.5 times\ninterquartile range below\n25th percentile")),
              fontface = "bold", vjust = 0.9) +
    geom_text(aes(x = c(1.17),
                  y =  ggplot_output[["lower_dots"]],
                  label = "Points"),
              vjust = 0.5, fontface = "bold") +
    geom_text(aes(x = c(1.75),
                  y =  ggplot_output[["lower_dots"]],
                  label = point_label),
              vjust = 0.5) +
    geom_label(aes(x = 1.17, y = ggplot_output[["quartiles"]],
                   label = names(ggplot_output[["quartiles"]])),
               vjust = c(0.4,0.85,0.4),
               fill = "white", label.size = 0) +
    ylab("") + xlab("") +
    theme(axis.text = element_blank(),
          axis.ticks = element_blank(),
          panel.grid = element_blank(),
          panel.background = element_blank(),
          panel.border = element_blank(),
          #aspect.ratio = 4/3,
          plot.margin = margin(0, 10, 0, 0),
          plot.title = element_text(hjust = 0.5, size = 10)) +
    coord_cartesian(xlim = c(1.4,3.1), ylim = c(-450, 900))

  return(explain_plot)

}
