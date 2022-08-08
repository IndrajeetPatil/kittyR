test_that(
  desc = "kitty_pics_df works as expected",
  code = {
    skip_on_cran()

    set.seed(123)
    df1 <- kitty_pics_df(url = "https://unsplash.com/s/photos/cat/")

    expect_equal(dim(df1)[2], 3L)
    expect_true(dim(df1)[1] > 0L)
    expect_s3_class(df1, "tbl_df")
  }
)
