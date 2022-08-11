test_that("Unavailable sounds produce a message", {
  expect_snapshot_warning(meowR(10L))
})
