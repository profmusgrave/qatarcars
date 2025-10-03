#' Fuel economy, size, performance, and price data for cars in Qatar 
#'
#' Includes prices and other specifications taken from YallaMotors Qatar 
#' between January to August 2025
#'
#' @format A tibble with 99 rows and 15 variables:
#' \describe{
#'   \item{origin}{a factor denoting car country of origin}
#'   \item{make}{a factor denoting car make}
#'   \item{model}{a factor denoting car model}
#'   \item{length}{a number denoting car length (meters)}
#'   \item{width}{a number denoting car width (meters)}
#'   \item{height}{a number denoting car height (meters)}
#'   \item{seating}{a number denoting number of seats in car}
#'   \item{trunk}{a number denoting volume of trunk (liters)}
#'   \item{economy}{a number denoting car fuel economy (L/100km)}
#'   \item{horsepower}{a number denoting car horsepower}
#'   \item{price}{a number denoting car price (2025 Qatari riyals (QAR))}
#'   \item{mass}{a number denoting car mass (kilograms)}
#'   \item{performance}{a number denoting car performance (Time 0-100 km/h (seconds))}
#'   \item{type}{a factor denoting car type}
#'   \item{enginetype}{a factor denoting car engine type}
#' }
#' @source \url{https://github.com/profmusgrave/qatarcars}
#' @source \url{https://open.substack.com/pub/musgrave/p/introducing-the-qatar-cars-dataset}
#' @source \url{https://qatar.yallamotor.com/}
"qatarcars"
