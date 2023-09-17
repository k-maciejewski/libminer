test_that("lib_summary returns expected results", {
  res <- lib_summary()
  # we expect object returned to be df
  expect_s3_class(res, "data.frame")
  # expect 2 columns
  expect_equal(ncol(res), 2)
  expect_equal(names(res), c("Library", "n_packages"))
  # library col should be char vec
  expect_type(res$Library, "character")
  # n_packages should be integer
  expect_type(res$n_packages, "integer")
})

test_that("lib_summary fails appropriately", {
  expect_error(lib_summary("foo"), "unused argument")
})
