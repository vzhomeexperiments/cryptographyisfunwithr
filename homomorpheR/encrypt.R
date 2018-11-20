#' Basic encrypting function
#'
#' @param x - data to encrypt 
#' @param public_key - public key object
#'
#' @return
#' @export
#'
#' @examples
encrypt <- function(x, public_key) {
  
  public_key$encrypt(x)
  
  }