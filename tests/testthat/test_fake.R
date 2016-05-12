library(template)

context("Fake test")

test_that("examplefunction can be run", {
  output <- examplefunction("testing")
  expect_match(output, "testing")
})
