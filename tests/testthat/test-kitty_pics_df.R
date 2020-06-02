testthat::test_that(
  desc = "kitty_pics_df works as expected",
  code = {
    testthat::skip_on_cran()
    testthat::skip_on_travis()
    testthat::skip_on_appveyor()

    set.seed(123)
    df1 <- kittyR::kitty_pics_df(url = "https://unsplash.com/s/photos/cat/")
    df2 <- kittyR::kitty_pics_df(url = "https://www.reshot.com/search/kitten/")

    testthat::expect_equal(dim(df1), c(9L, 3L))
    testthat::expect_equal(dim(df2), c(33L, 3L))
    testthat::expect_is(df1, "tbl_df")
  }
)
