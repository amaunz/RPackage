#' Read CSV data
#' @param x file path to CSV
#' @return data frame 

readDataCsv <- function() {
  read.csv(get_pkg_globals('csvPath'), colClasses='character', stringsAsFactors=F, na.strings='')
}

