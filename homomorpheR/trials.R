# Looking into the Homomorphic encryption in R

# install.packages("homomorpheR")
# this package is also using these 2 packages
# package ‘gmp’ successfully unpacked and MD5 sums checked
# package ‘sodium’ successfully unpacked and MD5 sums checked

library(homomorpheR)

source("homomorpheR/encryptAndDecrypt.R")
source("homomorpheR/encrypt.R")
source("homomorpheR/decrypt.R")

# E(x)+E(y)=E(x+y)

# There are secure encryption schemes which allow one to run programs on
# encrypted data and produce encrypted results, without the ability to decrypt
# the data. This is known as fully homomorphic encryption. 

# generating a key pair
keyPair <- PaillierKeyPair$new(modulusBits = 1024)

# our public key
pubKey <- keyPair$pubkey

# our private key
prvKey <- keyPair$getPrivateKey()

# encrypt and decrypt some numbers

# create a number
library(gmp)

# convert my money in paypal account to class 'bigz' raw vector
money_paypal <- gmp::as.bigz(1234)

# same for my other account
money_ubs <- gmp::as.bigz(4321)

# encrypt paypal
paypal_enc <- encrypt(money_paypal, pubKey)

# decrypt paypal
paypal_dec <- decrypt(paypal_enc, prvKey)

# encrypt ubs
ubs_enc <- encrypt(money_ubs, pubKey)

# decrypt ubs
ubs_dec <- decrypt(ubs_enc, prvKey)

# now we can perform arithmetical operation (sum) on the encrypted data!!!
total_encrypted <- paypal_enc + ubs_enc

# we have a big number
print(total_encrypted)

# which we can decrypt
res_decrypted_totals <- decrypt(total_encrypted, prvKey)

# print result
print(res_decrypted_totals)

# identical?
identical(res_decrypted_totals, money_paypal + money_ubs)

### does not work...
