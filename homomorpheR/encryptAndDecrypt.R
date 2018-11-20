#' Title
#'
#' @param x 
#'
#' @return
#' @export
#'
#' @examples
encryptAndDecrypt <- function(x) {
  
  keyPair$getPrivateKey()$decrypt(keyPair$pubkey$encrypt(x))
  
  }