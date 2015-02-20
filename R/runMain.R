#' Run read plate layout
#' @param dir directory
#' @param ... further arguments
#' see sampleConfig() for a config

runMain <- function(
             dir=NULL,
             ...) {
  
  set.seed(42)

  # write config to package-global environment 'pkg_globals'
  assign_pkg_globals('dir', dir)

  # remove config from current environment
  rm(dir, envir=environment())

  # fill the rest of the config
  sampleConfig()

}
