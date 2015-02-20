# source() to manually run long tests below inst/

# edit single tests to enable interactive mode for manual testing
# tests are also executed during R CMD check -- disable interactive mode before commiting

# edit report.R to let .Rnw and .Rmd files point to your development version
# tests are also executed during R CMD check -- comment out file links before commiting

setwd('~/cytProfl')

rm(list = ls())

library(testthat)

sourceDir <- function(path, trace = TRUE, ...) {
  for (nm in list.files(path, pattern = "\\.[RrSsQq]$")) {
    if(trace) cat(nm,":")
    source(file.path(path, nm), ...)
    if(trace) cat("\n")
  }
}
sourceDir('R')
.onLoad()

test_file('inst/tests/test-runReadData.R')

.onUnload()
