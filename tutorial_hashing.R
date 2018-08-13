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
"hello world" %>% md5()
"hello world" %>% md5(key = "nothing")
"hello world" %>% md5(key = serialize(file("README.md"),connection = NULL))

# -> try the same with sha512() 

## How can it be useful?

# how to check if the file was changed? (run code again after changing the file)
file("README.md") %>% md5()

# this command will download the file and calculate md5 hash
md5(url("https://cran.r-project.org/bin/windows/base/R-3.5.0-win.exe"))

# obtained value:            md5 d3:f5:79:b3:aa:cf:df:45:a0:08:df:33:20:cb:36:15
#value from cran.r-project.org: d3f579b3aacfdf45a008df3320cb3615 *R-3.5.0-win.exe

# create your own algorithm to generate random passwords