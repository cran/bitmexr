

test_that("The bucket_trades() function works", {


  # capture_requests({
  #  res <- bucket_trades()
  #
  #  expect_is(res, "data.frame")
  #  expect(length(res) > 0, failure_message = "No data returned")
  #  expect_error(bucket_trades(count = 1001))
  #  expect_error(bucket_trades(startTime = "not-a-valid-datetime-format"))
  #  expect_error(bucket_trades(endTime = "not-a-valid-datetime-format"))
  #
  #  expect_error(bucket_trades(symbol = "not valid"))
  #
  # }
  # )

  with_mock_api({
    res <- bucket_trades()

    expect_is(res, "data.frame")
    expect(length(res) > 0, failure_message = "No data returned")
    expect_error(bucket_trades(count = 1001))
    expect_error(bucket_trades(startTime = "not-a-valid-datetime-format"))
    expect_error(bucket_trades(endTime = "not-a-valid-datetime-format"))

    expect_error(bucket_trades(symbol = "not valid"))
  })
})