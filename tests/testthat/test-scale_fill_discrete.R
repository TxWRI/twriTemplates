test_that("scale_fill_discrete returns errors", {
  df <- data.frame(x = letters, y = 1)
  p <-  ggplot(df, aes(x, 1, fill = x)) +
    geom_col() +
    scale_fill_discrete_twri()
  expect_warning(print(p))
}
)
