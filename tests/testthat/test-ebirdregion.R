context("ebirdregion")

test_that("ebirdregion works correctly", {
  out <- ebirdregion(region = 'US', species = 'Setophaga caerulescens', max = 50)
  expect_is(out, "data.frame")
  expect_equal(dim(out), c(50,11))
  expect_is(out$comName, "character")
  expect_is(out$howMany, "numeric")

  expect_equal(dim(ebirdregion('US-OH', max=10, provisional=TRUE, hotspot=TRUE)), c(10,11))
  
  res <- ebirdregion(region = 'US-CA', max = 10)
  expect_equal(ncol(res), 11)

  expect_equal(nrow(ebirdregion(region = 'US-CA', species = 'Accipiter gentilis', back=1)), 0)
  
  expect_equal(ncol(ebirdregion(region = 'US', species = 'Accipiter gentilis')), 11)
})