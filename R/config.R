#' Load a sample configuration
#' Avoiding overwriting existing variables

sampleConfig <- function() {

  # DO NOT REMOVE -- FOR PACKAGE CHECKS
  dir                =NULL; rm(dir              ) 
  # DO NOT REMOVE -- FOR PACKAGE CHECKS

  # Basic parameters
  if(!exists('dir', envir=pkg_globals) || !is.character(get_pkg_globals('dir')))
    assign_pkg_globals('dir', '/path/to/data'                                                           )
}
