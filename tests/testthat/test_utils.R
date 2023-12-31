context("Testing functions in utils.R")

test_that("check_date returns error if start/end date cannot be parsed", {
  expect_error(check_date("2019-0222-01", "2018-01-01"))
  expect_error(check_date("2019-01-01", "2019-0222-01"))
  expect_error(check_date("2019-0222-01", "2019-02222-05"))
})

test_that("check_date returns error if start_date > end_date", {
  expect_error(check_date("2019-01-01", "2018-01-01"))
})
