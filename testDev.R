# source() in you R session to continuously run quick tests below test/
# tests are also executed during R CMD check 

library(testthat)
library(MASS)

code_path = file.path(getwd(), 'R')
test_path = file.path(getwd(), 'tests/testthat')
auto_test(code_path=code_path, test_path=test_path)

