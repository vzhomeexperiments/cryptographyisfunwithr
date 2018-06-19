# R Script to Encrypt/Decrypt information
# ONLY FOR TRAINING PURPOSES
# UDEMY Course: "Cryptography is more fun with R!"
# (C) 2018 Vladimir Zhbanko, https://vladdsm.github.io/myblog_attempt/index.html
# Enjoying the code? Join the course https://udemy.com/keep-secret-under-control

### Used Libraries:
# install.packages("openssl")
# install.packages("tidyverse")
library(openssl)
library(tidyverse)

#help ?`openssl-package`

#### GENERATE RSA KEYS ####
if(!exists("keys")){dir.create("keys")}
# generate your private key (NB: make sure to do back up copy!!!)
rsa_keygen(bits = 5099) %>% 
  write_pem(path = "keys/private.pem", password = "")

# generate your public key (NB: optional. Use Private Key to encrypt/decrypt)
read_key(file = "keys/private.pem", password = "") %>% 
  # extract element of the list and write to file
  `[[`("pubkey") %>% write_pem("keys/public.pub")

#### UNDERSTAND RSA KEYS ####
# Note: this procedure is only for understanding
# read private key from file and output structure of the object
private_key <- read_key("keys/private.pem", password = "")
# look about the structure of the key
str(private_key)

# read public key from file
public_key <- read_pubkey("keys/public.pub")
str(public_key)

# delete history and empty environment
rm(private_key)
