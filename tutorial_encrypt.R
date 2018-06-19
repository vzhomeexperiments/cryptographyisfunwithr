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

#### Encrypt the message with PUBLIC key (e.g. send this code to collaborator)
"Hello World!" %>% 
  # serialize the object
  serialize(connection = NULL) %>% 
  # encrypt the object
  encrypt_envelope("keys/public.pub") %>% 
  # write encrypted data to File
  write_rds("message.enc")

## Encrypt with PRIVATE key (e.g. use this code yourself)
"Hello World!" %>% 
  # serialize the object
  serialize(connection = NULL) %>% 
  # encrypt the object
  encrypt_envelope("keys/private.pem") %>% 
  # write encrypted data to File
  write_rds("message.enc")

# do yourself: encrypt cars dataset using above snippet, create object "cars.enc"
