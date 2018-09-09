# R Script to Encrypt/Decrypt information
# ONLY FOR TRAINING PURPOSES
# UDEMY Course: "Cryptography is more fun with R!"
# (C) 2018 Vladimir Zhbanko, https://vladdsm.github.io/myblog_attempt/index.html
# Enjoying the code? Join the course https://www.udemy.com/keep-your-secrets-under-control/?couponCode=KEEP-SECRET-10

### To install R:
# Step 1 Download and install R-Engine https://www.r-project.org/
# Step 2 Download and install R-Studio https://www.rstudio.com/

### Free course about R:
# https://www.datacamp.com/courses/free-introduction-to-r

### Install relevant Libraries:
install.packages("openssl")
install.packages("tidyverse")

# load packages
library(openssl)
library(tidyverse)

# check that package was installed
search()
