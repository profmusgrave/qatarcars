test_that("data objects are unchanged", {
  expect_snapshot_value(qatarcars, style = "serialize")
})
