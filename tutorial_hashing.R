# R Script to Encrypt/Decrypt information
# ONLY FOR TRAINING PURPOSES
# UDEMY Course: "Cryptography is more fun with R!"
# (C) 2018 Vladimir Zhbanko, https://vladdsm.github.io/myblog_attempt/index.html
# Enjoying the code? Join the course https://www.udemy.com/keep-your-secrets-under-control/?couponCode=KEEP-SECRET-10

### Used Libraries:
# install.packages("openssl")
# install.packages("tidyverse")
library(openssl)
library(tidyverse)

#help ?`openssl-package`

#### understanding HASHING ####
# help for hashing function ?md5

# Hashing -> one way cryptographic process
"John" %>% md5()
"John" %>% md5(key = "nothing")
"hello world" %>% md5(key = serialize(file("README.md"),connection = NULL))

# -> try the same with sha512() 

## How can it be useful?

# how to check if the file was changed? (run code again after changing the file)
file("README.md") %>% md5()

# how to generate unique password?

# generate password string the way you can reproduce and more secure
"specific string" %>% sha512(key = "123456")

# generate unique password, introducing randomness of the current time (you must know exact date and exact time to reproduce)
paste(Sys.Date(), "Cryptography is more fun using R!") %>% 
  as.character.Date() %>% 
  sha512(key = as.character(Sys.time()))

# generate password but take your desired piece start/end position and write to the file
Sys.Date() %>% as.character.Date() %>% sha512(key = as.character(Sys.time())) %>%
  substring(first = 3, last = 23) %>% as.data.frame.character() %>% write_tsv("p.txt")

### what about function? ###
generate_password <- function(salt = "Cryptography is cool!",
                              pass_begin = 3, pass_end = 23, 
                              file_name = "p.txt") {
  require(openssl)
  require(tidyverse)
  paste(Sys.Date(), salt) %>% 
    as.character.Date() %>%
    sha512(key = as.character(Sys.time())) %>%
    substring(first = pass_begin, last = pass_end) %>%
    as.data.frame.character() %>%
    write_tsv(file_name)
}

# using function
generate_password(salt = "hello",
                  1, 10, "my_password.txt")
