#' Convert between SI and imperial units
#'
#' @description
#' Functions to convert between SI and imperial units for various 
#' measurements in the `qatarcars` dataset.
#'
#' @details
#'
#' ## Conversion factors
#'
#' The National Institute of Standards and Technology in the United States and 
#' other international legal standards legally define different imperial and US 
#' measures as SI (International System) units (i.e. meters, grams, liters).
#'
#' **Distance (meters ↔ feet)**
#'
#' - 1 foot = 0.3048 meters ([official standard](https://en.wikipedia.org/wiki/Foot_(unit)))
#' - 1 meter = 3.28084 feet, or \eqn{\frac{1}{0.3048}}
#'
#' **Mass (kilograms ↔ pounds)**
#'
#' - 1 pound = 0.45359237 kilograms ([official standard](https://en.wikipedia.org/wiki/International_yard_and_pound))
#' - 1 kilogram = 2.204623 pounds, or \eqn{\frac{1}{0.45359237}}
#'
#' **Volume (liters ↔ cubic feet)**
#'
#' - 1 liter = 0.03531467 cubic feet
#' - 1 cubic foot = 28.31684 liters or \eqn{\frac{1}{0.03531467}}
#' 
#' *Note*: 1 liter = 0.001 cubic meters, so in cubic feet, 1 liter = \eqn{0.001 \times \left(\frac{1}{0.3048}\right)^3} = 0.03531467
#'
#' **Fuel economy (L/100km ↔ MPG)**
#'
#' - 1 MPG = \eqn{\frac{235.215}{\text{L/100km}}}
#' - 1 L/100km = \eqn{\frac{235.215}{\text{MPG}}}
#'
#' *Derivation* (using rounded values; exact values used in code):
#'
#' - 1 US gallon = 231 cubic inches = 3.785411784 liters ([official standard](https://en.wikipedia.org/wiki/Gallon#US_gallon))
#' - 1 mile = 1.609344 kilometers, or \eqn{\frac{0.3048 \times 5280}{1000}}
#'
#' \deqn{
#'   \begin{aligned}
#'   \text{L/100km} &\rightarrow \text{MPG} \\
#'   &= \frac{100 \text{ km}}{\text{L/100km}} \times \frac{1 \text{ mile}}{1.609 \text{ km}} \times \frac{3.785 \text{ L}}{1 \text{ gallon}}\\
#'   &= \frac{100 \times 3.785}{1.609 \times \text{L/100km}} \times \frac{\text{ miles}}{\text{ gallon}} \\
#'   &\approx \frac{235.215}{\text{L/100km}} \text{ MPG}
#'   \end{aligned}
#' }
#' 
#' **Performance (0–100 km/h ↔ 0–60 mph)**
#'
#' This conversion is only approximate because 100 km/h corresponds to about
#' 62 mph, not exactly 60 mph, and cars may not accelerate at a constant rate.
#'
#' For a comparable estimate for users who work with US-based measurements, we 
#' assume constant acceleration (i.e. time is proportional to target speed).
#'
#' 60 mph = 96.56064 km/h (\eqn{\frac{0.3048 \times 5280 \times 60}{1000}}),
#' so 60 mph is ≈96.56% of 100 km/h. Thus:
#'
#' - 0–60 mph (s) = 0.9656064 × 0–100 km/h (s)
#' - 0–100 km/h (s) = 0–60 mph (s) / 0.9656064
#'
#' @param meters numeric vector of values in meters
#' @param feet numeric vector of values in feet
#' @param kg numeric vector of values in kilograms
#' @param lbs numeric vector of values in pounds
#' @param liters numeric vector of values in liters
#' @param cubic_feet numeric vector of values in cubic feet
#' @param lp100km numeric vector of fuel economy in liters per 100 km
#' @param mpg numeric vector of fuel economy in miles per gallon
#' @param kmh_time numeric vector of 0-100 km/h acceleration time in seconds
#' @param mph_time numeric vector of 0-60 mph acceleration time in seconds
#'
#' @return Numeric vector of converted values
#'
#' @examples
#' # Distance conversions
#' m_to_ft(4.5)
#' ft_to_m(14.76)
#'
#' # Mass conversions
#' kg_to_lbs(1500)
#' lbs_to_kg(3307)
#'
#' # Volume conversions
#' l_to_cuft(500)
#' cuft_to_l(17.66)
#'
#' # Fuel economy conversions
#' lp100km_to_mpg(8.5)
#' mpg_to_lp100km(27.67)
#'
#' # Performance conversions
#' kmh100_to_mph60(6.5)
#' mph60_to_kmh100(5.85)
#'
#' qatarcars$length_ft <- m_to_ft(qatarcars$length)
#' qatarcars$economy_mpg <- lp100km_to_mpg(qatarcars$economy)
#' qatarcars[, c("origin", "make", "model", "length", "length_ft", "economy", "economy_mpg")]
#'
#' # Labels are updated automatically
#' str(qatarcars$length_ft)
#' str(qatarcars$economy_mpg)
#'
#' if (require("dplyr")) {
#'   qatarcars |> 
#'     mutate(
#'       length_ft = m_to_ft(length),
#'       economy_mpg = lp100km_to_mpg(economy)
#'     ) |> 
#'     select(origin, make, model, length, length_ft, economy, economy_mpg)
#' }
#' @name unit_conversion
NULL

# Distance conversions ----
#' @rdname unit_conversion
#' @export
m_to_ft <- function(meters) {
  out <- meters * (1 / 0.3048)
  set_label(out, meters, gsub("\\(m\\)", "(ft)", attr(meters, "label")))
}

#' @rdname unit_conversion
#' @export
ft_to_m <- function(feet) {
  out <- feet * 0.3048
  set_label(out, feet, gsub("\\(ft\\)", "(m)", attr(feet, "label")))
}

# Mass conversions ----
#' @rdname unit_conversion
#' @export
kg_to_lbs <- function(kg) {
  out <- kg * (1 / 0.45359237)
  set_label(out, kg, gsub("\\(kg\\)", "(lbs)", attr(kg, "label")))
}

#' @rdname unit_conversion
#' @export
lbs_to_kg <- function(lbs) {
  out <- lbs * 0.45359237
  set_label(out, lbs, gsub("\\(lbs\\)", "(kg)", attr(lbs, "label")))
}

# Volume conversions ----
#' @rdname unit_conversion
#' @export
l_to_cuft <- function(liters) {
  out <- liters * (0.001 * (1 / 0.3048)^3)
  set_label(out, liters, gsub("\\(L\\)", "(cu ft)", attr(liters, "label")))
}

#' @rdname unit_conversion
#' @export
cuft_to_l <- function(cubic_feet) {
  out <- cubic_feet * (1 / (0.001 * (1 / 0.3048)^3))
  set_label(out, cubic_feet, gsub("\\(cu ft\\)", "(L)", attr(cubic_feet, "label")))
}

# Fuel economy conversions ----
#' @rdname unit_conversion
#' @export
lp100km_to_mpg <- function(lp100km) {
  conversion_factor <- 100 * 
    3.785411784 /  # liters in a gallon
    (0.3048 * 5280 / 1000)  # kilometers in a mile
  out <- conversion_factor / lp100km
  set_label(out, lp100km, gsub("\\(L/100km\\)", "(mpg)", attr(lp100km, "label")))
}

#' @rdname unit_conversion
#' @export
mpg_to_lp100km <- function(mpg) {
  conversion_factor <- 100 * 
    3.785411784 /  # liters in a gallon
    (0.3048 * 5280 / 1000)  # kilometers in a mile
  out <- conversion_factor / mpg
  set_label(out, mpg, gsub("\\(mpg\\)", "(L/100km)", attr(mpg, "label")))
}

# Performance conversions ----
#' @rdname unit_conversion
#' @export
kmh100_to_mph60 <- function(kmh_time) {
  out <- kmh_time * (0.3048 * 5280 * 60 / 1000 / 100)
  set_label(out, kmh_time, gsub("0-100 km/h", "0-60 mph", attr(kmh_time, "label")))
}

#' @rdname unit_conversion
#' @export
mph60_to_kmh100 <- function(mph_time) {
  out <- mph_time / (0.3048 * 5280 * 60 / 1000 / 100)
  set_label(out, mph_time, gsub("0-60 mph", "0-100 km/h", attr(mph_time, "label")))
}
