#' Add a label attribute to an input value only if it already has a label attribute 
#' 
#' This is useful with conversion functions since columns in `qatarcars` have 
#' labels already, and if a conversion function is used on them, that label 
#' carries over.
#' 
#' @keywords internal
set_label <- function(value, original, label) {
  if (!is.null(attr(original, "label"))) {
    attr(value, "label") <- label
  }
  value
}
