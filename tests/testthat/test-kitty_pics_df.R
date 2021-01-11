test_that(
  desc = "kitty_pics_df works as expected",
  code = {
    skip_on_cran()
    skip_on_travis()
    skip_on_appveyor()

    set.seed(123)
    df1 <- kitty_pics_df(url = "https://unsplash.com/s/photos/cat/")
    set.seed(123)
    df2 <- kitty_pics_df(url = "https://www.reshot.com/search/kitten/")

    expect_equal(dim(df1)[2], 3L)
    expect_equal(dim(df2)[2], 3L)
    expect_true(dim(df1)[1] > 0L & dim(df2)[1] > 0L)
    expect_s3_class(df1, "tbl_df")
  }
)
