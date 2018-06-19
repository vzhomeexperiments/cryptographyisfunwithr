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

#### DECRYPT the message with PRIVATE key ####
# read file with Encrypted Information (from Computer File System to R Environment)
secret_encrypted <- read_rds("message.enc")

# decrypting the list from R Environment
decrypt_envelope(data = secret_encrypted$data,
                 iv = secret_encrypted$iv,
                 session = secret_encrypted$session,
                 key = "keys/private.pem",
                 password = "") %>% 
  # getting back original object
  unserialize() 

# remove secret_encrypted object
rm(secret_encrypted)
