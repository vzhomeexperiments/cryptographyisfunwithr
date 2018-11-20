#' Title
#'
#' @param E - encrypted object
#' @param prv_key - private key
#'
#' @return
#' @export
#'
#' @examples
decrypt <- function(E, prv_key) {
  
  prv_key$decrypt(E)
  
  }