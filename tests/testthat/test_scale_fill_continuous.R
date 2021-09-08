test_that("scale_fill_continuous_twri returns expected colors", {
  df <- data.frame(x = c(0, 1))
  p <- ggplot(df, aes(x, 1, fill = x)) +
    geom_col() +
    scale_fill_continuous_twri()
  correct_fill <- c( "#64A6E3", "#172D42" )
  expect_equal(layer_data(p)$fill, correct_fill, ignore_attr = TRUE)
})


test_that("scale_color_continuous_twri returns expected colors", {
  df <- data.frame(x = c(0, 1))
  p <- ggplot(df, aes(x, 1, color = x)) +
    geom_col() +
    scale_color_continuous_twri()
  correct_color <- c( "#64A6E3", "#172D42" )
  expect_equal(layer_data(p)$colour, correct_color, ignore_attr = TRUE)
})
