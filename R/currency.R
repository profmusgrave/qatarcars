#' Add a label attribute to an input value only if it already has a label attribute 
#' 
#' This is useful with the currency conversion functions since the `price`
#' column in `qatarcars` has a label already ("Price (QAR)"), and if something
#' like `qar_to_usd()` is used on it, that label carries over.
#' 
#' @keywords internal
set_currency_label <- function(value, original, label) {
  if (!is.null(attr(original, "label"))) {
    attr(value, "label") <- label
  }
  value
}

#' Convert between QAR, USD, and EUR
#'
#' @description
#' Functions to convert between Qatari Riyals (QAR), US Dollars (USD), and 
#' Euros (EUR) using exchange rates from the time of data collection in 
#' January 2025.
#'
#' @details
#' Exchange rates in January 2025:
#' - 1 USD = 3.64 QAR
#' - 1 EUR = 4.15 QAR
#'
#' @param qar numeric vector of values in Qatari Riyals
#' @param usd numeric vector of values in US Dollars
#' @param eur numeric vector of values in Euros
#'
#' @return Numeric vector of converted currency amounts
#'
#' @examples
#' qar_to_usd(100)
#' usd_to_eur(50)
#' eur_to_qar(25)
#' 
#' qatarcars$price_eur <- qar_to_eur(qatarcars$price)
#' qatarcars$price_usd <- qar_to_usd(qatarcars$price)
#' qatarcars[, c("origin", "make", "model", "price", "price_eur", "price_usd")]
#' 
#' # Labels are updated automatically
#' str(qatarcars$price)
#' str(qatarcars$price_eur)
#' str(qatarcars$price_usd)
#' 
#' if (require("dplyr")) {
#'   qatarcars |> 
#'     mutate(
#'       price_eur = qar_to_eur(price), 
#'       price_usd = qar_to_usd(price)
#'     ) |> 
#'     select(origin, make, model, starts_with("price"))
#' }
#' @name currency_conversion
NULL

#' @rdname currency_conversion
#' @export
qar_to_usd <- function(qar) {
  out <- qar / 3.64
  set_currency_label(out, qar, "Price (USD)")
}

#' @rdname currency_conversion
#' @export
qar_to_eur <- function(qar) {
  out <- qar / 4.15
  set_currency_label(out, qar, "Price (EUR)")
}

#' @rdname currency_conversion
#' @export
usd_to_qar <- function(usd) {
  out <- usd * 3.64
  set_currency_label(out, usd, "Price (QAR)")
}

#' @rdname currency_conversion
#' @export
usd_to_eur <- function(usd) {
  out <- usd * 3.64 / 4.15
  set_currency_label(out, usd, "Price (EUR)")
}

#' @rdname currency_conversion
#' @export
eur_to_qar <- function(eur) {
  out <- eur * 4.15
  set_currency_label(out, eur, "Price (QAR)")
}

#' @rdname currency_conversion
#' @export
eur_to_usd <- function(eur) {
  out <- eur * 4.15 / 3.64
  set_currency_label(out, eur, "Price (USD)")
}
