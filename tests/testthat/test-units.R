test_that("basic distance conversions work correctly", {
  expect_equal(m_to_ft(0.3048), 1)
  expect_equal(ft_to_m(1), 0.3048)
  expect_equal(m_to_ft(1), 1 / 0.3048)
})

test_that("basic mass conversions work correctly", {
  expect_equal(kg_to_lbs(0.45359237), 1)
  expect_equal(lbs_to_kg(1), 0.45359237)
  expect_equal(kg_to_lbs(1), 1 / 0.45359237)
})

test_that("basic volume conversions work correctly", {
  expect_equal(l_to_cuft(1), 0.001 * (1 / 0.3048)^3)
  expect_equal(cuft_to_l(1), 1 / (0.001 * (1 / 0.3048)^3))
})

test_that("basic fuel economy conversions work correctly", {
  conversion_factor <- 100 * 3.785411784 / (0.3048 * 5280 / 1000)

  expect_equal(lp100km_to_mpg(1), conversion_factor)
  expect_equal(mpg_to_lp100km(1), conversion_factor)
  expect_equal(lp100km_to_mpg(conversion_factor), 1)
})

test_that("basic performance conversions work correctly", {
  expect_equal(kmh100_to_mph60(10), 10 * (0.3048 * 5280 * 60 / 1000 / 100))
  expect_equal(mph60_to_kmh100(10), 10 / (0.3048 * 5280 * 60 / 1000 / 100))
})

test_that("round-trip conversions work", {
  # Distance
  expect_equal(ft_to_m(m_to_ft(5)), 5)
  expect_equal(m_to_ft(ft_to_m(15)), 15)

  # Mass
  expect_equal(lbs_to_kg(kg_to_lbs(100)), 100)
  expect_equal(kg_to_lbs(lbs_to_kg(220)), 220)

  # Volume
  expect_equal(cuft_to_l(l_to_cuft(500)), 500)
  expect_equal(l_to_cuft(cuft_to_l(17.5)), 17.5)

  # Fuel economy
  expect_equal(mpg_to_lp100km(lp100km_to_mpg(8)), 8)
  expect_equal(lp100km_to_mpg(mpg_to_lp100km(30)), 30)

  # Performance
  expect_equal(mph60_to_kmh100(kmh100_to_mph60(6.5)), 6.5)
  expect_equal(kmh100_to_mph60(mph60_to_kmh100(5.8)), 5.8)
})

test_that("functions handle vectors", {
  expect_equal(m_to_ft(c(1, 2, 3)), c(1, 2, 3) * (1 / 0.3048))
  expect_equal(kg_to_lbs(c(50, 100)), c(50, 100) * (1 / 0.45359237))
  expect_equal(lp100km_to_mpg(c(5, 10, 15)), 
               c(5, 10, 15) |> 
                 vapply(\(x) 100 * 3.785411784 / (0.3048 * 5280 / 1000) / x, numeric(1)))
})

test_that("functions handle missing values", {
  expect_equal(m_to_ft(NA), NA_real_)
  expect_equal(kg_to_lbs(c(100, NA, 200)), c(100, NA, 200) * (1 / 0.45359237))
  expect_equal(lp100km_to_mpg(c(8, NA)), c(100 * 3.785411784 / (0.3048 * 5280 / 1000) / 8, NA))
})

test_that("labels are preserved and updated when present", {
  # Distance
  meters_with_label <- 5
  attr(meters_with_label, "label") <- "Length (m)"

  feet_result <- m_to_ft(meters_with_label)
  expect_equal(attr(feet_result, "label"), "Length (ft)")

  feet_with_label <- 15
  attr(feet_with_label, "label") <- "Length (ft)"

  meters_result <- ft_to_m(feet_with_label)
  expect_equal(attr(meters_result, "label"), "Length (m)")

  # Mass
  kg_with_label <- 100
  attr(kg_with_label, "label") <- "Mass (kg)"

  lbs_result <- kg_to_lbs(kg_with_label)
  expect_equal(attr(lbs_result, "label"), "Mass (lbs)")

  lbs_with_label <- 220
  attr(lbs_with_label, "label") <- "Mass (lbs)"

  kg_result <- lbs_to_kg(lbs_with_label)
  expect_equal(attr(kg_result, "label"), "Mass (kg)")

  # Volume
  liters_with_label <- 500
  attr(liters_with_label, "label") <- "Volume (L)"

  cuft_result <- l_to_cuft(liters_with_label)
  expect_equal(attr(cuft_result, "label"), "Volume (cu ft)")

  cuft_with_label <- 17
  attr(cuft_with_label, "label") <- "Volume (cu ft)"

  liters_result <- cuft_to_l(cuft_with_label)
  expect_equal(attr(liters_result, "label"), "Volume (L)")

  # Fuel economy
  lp100km_with_label <- 8
  attr(lp100km_with_label, "label") <- "Economy (L/100km)"

  mpg_result <- lp100km_to_mpg(lp100km_with_label)
  expect_equal(attr(mpg_result, "label"), "Economy (mpg)")

  mpg_with_label <- 30
  attr(mpg_with_label, "label") <- "Economy (mpg)"

  lp100km_result <- mpg_to_lp100km(mpg_with_label)
  expect_equal(attr(lp100km_result, "label"), "Economy (L/100km)")

  # Performance
  kmh_with_label <- 6.5
  attr(kmh_with_label, "label") <- "0-100 km/h (s)"

  mph_result <- kmh100_to_mph60(kmh_with_label)
  expect_equal(attr(mph_result, "label"), "0-60 mph (s)")

  mph_with_label <- 5.8
  attr(mph_with_label, "label") <- "0-60 mph (s)"

  kmh_result <- mph60_to_kmh100(mph_with_label)
  expect_equal(attr(kmh_result, "label"), "0-100 km/h (s)")
})

test_that("labels are not added when absent", {
  meters_plain <- 5
  expect_null(attr(m_to_ft(meters_plain), "label"))

  kg_plain <- 100
  expect_null(attr(kg_to_lbs(kg_plain), "label"))

  liters_plain <- 500
  expect_null(attr(l_to_cuft(liters_plain), "label"))

  lp100km_plain <- 8
  expect_null(attr(lp100km_to_mpg(lp100km_plain), "label"))

  kmh_plain <- 6.5
  expect_null(attr(kmh100_to_mph60(kmh_plain), "label"))
})
