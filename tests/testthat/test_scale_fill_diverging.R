test_that("scale_fill_diverging returns expected colors", {
  df <- data.frame(x = c(0, 1, 2))
  p <- ggplot(df, aes(x, 1, fill = x)) +
    geom_col() +
    scale_fill_diverging_twri(limits = c(-1, 1))
  correct_fill <- c("#F0F0C9", "#0054A4", "grey50")
  expect_equal(layer_data(p)$fill, correct_fill, ignore_attr = TRUE)
})


test_that("scale_color_diverging_twri returns expected colors", {
  df <- data.frame(x = c(0, 1, 2))
  p <- ggplot(df, aes(x, 1, color = x)) +
    geom_col() +
    scale_color_diverging_twri(limits = c(-1, 1))
  correct_color <- c("#F0F0C9", "#0054A4", "grey50")
  expect_equal(layer_data(p)$colour, correct_color, ignore_attr = TRUE)
})
