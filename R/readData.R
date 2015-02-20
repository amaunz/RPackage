#' Read CSV data, enforce string representation
#' @param csvFilePath file path to CSV
#' @return data frame 

readDataCsv <- function(csvFilePath) {
  read.csv(csvFilePath, colClasses='character', stringsAsFactors=F, na.strings='')
}

