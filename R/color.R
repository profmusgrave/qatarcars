#' Qatar maroon color
#'
#' @description
#' The official colors of the Qatari flag are white and Pantone 1955 C, or 
#' "Qatar maroon." The hex representation of this color is `#8A1538`.
#'
#' @format A character string containing a hex color code.
#'
#' @source \url{https://en.wikipedia.org/wiki/Flag_of_Qatar}
#'
#' @examples
#' qatar_maroon
#'
#' hist(qatarcars$length, breaks = 15, col = qatar_maroon, border = "white")
#'
#' if (require("ggplot2")) {
#'   ggplot(qatarcars, aes(x = length)) +
#'     geom_histogram(bins = 15, fill = qatar_maroon, color = "white")
#' }
#'
#' @export
qatar_maroon <- "#8A1538"
