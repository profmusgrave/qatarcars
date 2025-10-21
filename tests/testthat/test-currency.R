test_that("basic currency conversions work correctly", {
  expect_equal(qar_to_usd(3.64), 1)
  expect_equal(qar_to_eur(4.15), 1)

  expect_equal(usd_to_qar(1), 3.64)
  expect_equal(usd_to_eur(1), 3.64 / 4.15)

  expect_equal(eur_to_qar(1), 4.15)
  expect_equal(eur_to_usd(1), 4.15 / 3.64)

})

test_that("round-trip conversions work", {
  expect_equal(usd_to_qar(qar_to_usd(100)), 100)
  expect_equal(eur_to_qar(qar_to_eur(100)), 100)
  expect_equal(qar_to_usd(usd_to_qar(50)), 50)
  expect_equal(qar_to_eur(eur_to_qar(50)), 50)
  expect_equal(usd_to_eur(eur_to_usd(25)), 25)
  expect_equal(eur_to_usd(usd_to_eur(25)), 25)
})

test_that("functions handle vectors", {
  expect_equal(qar_to_usd(c(3.64, 7.28)), c(1, 2))
  expect_equal(usd_to_qar(c(1, 2, 3)), c(3.64, 7.28, 10.92))
})

test_that("functions handle missing values", {
  expect_equal(qar_to_usd(NA), NA_real_)
  expect_equal(usd_to_qar(c(1, NA, 3)), c(3.64, NA, 10.92))
})

test_that("labels are preserved and updated when present", {
  # QAR to other things
  qar_with_label <- 100
  attr(qar_with_label, "label") <- "Price (QAR)"

  usd_result <- qar_to_usd(qar_with_label)
  expect_equal(attr(usd_result, "label"), "Price (USD)")

  eur_result <- qar_to_eur(qar_with_label)
  expect_equal(attr(eur_result, "label"), "Price (EUR)")

  # USD to other things
  usd_with_label <- 50
  attr(usd_with_label, "label") <- "Price (USD)"

  qar_result <- usd_to_qar(usd_with_label)
  expect_equal(attr(qar_result, "label"), "Price (QAR)")

  eur_result2 <- usd_to_eur(usd_with_label)
  expect_equal(attr(eur_result2, "label"), "Price (EUR)")

  # EUR to other things
  eur_with_label <- 75
  attr(eur_with_label, "label") <- "Price (EUR)"

  qar_result2 <- eur_to_qar(eur_with_label)
  expect_equal(attr(qar_result2, "label"), "Price (QAR)")

  usd_result2 <- eur_to_usd(eur_with_label)
  expect_equal(attr(usd_result2, "label"), "Price (USD)")
})

test_that("labels are not added when absent", {
  qar_plain <- 100

  usd_result <- qar_to_usd(qar_plain)
  expect_null(attr(usd_result, "label"))

  eur_result <- qar_to_eur(qar_plain)
  expect_null(attr(eur_result, "label"))
})
