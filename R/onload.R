#' Create a package-global environment, loaded on package startup
#' Attach it to search path and avoid passing around variables
#' @param libname Library name
#' @param pkgname Package name

.onLoad <- function(libname, pkgname) {
      if (exists('pkg_globals')) {
        stop('onLoad: Package-global environment exists')
      } 
      if ('pkg_globals' %in% search()) {
        stop('onLoad: Package-global environment in search path')
      }
      else {
        assign("pkg_globals", new.env(), envir=parent.env(environment()))
      }
}


#' Destroy package-global environment
#' @param path The path from which this is called

.onUnload <- function(path=NULL) {
  if (exists('pkg_globals')) {
    tryCatch(rm(pkg_globals, inherits=T), error=function(cond){})
  }
}




#' Assign variables to package-global environment.
#' Detach (recursively), assign, attach.
#' pkg_globals should be at search path position 2.
#' @param varName Name of variable as character
#' @param varValue Value of character

assign_pkg_globals <- function(varName, varValue) {

  # check pkg_globals exists
  if(!exists('pkg_globals')) stop ('Package-global environment does not exist')

  # write to pkg_globals
  assign(varName, varValue, envir=pkg_globals)

}




#' Get variables from package-global environment.
#' @param varName Name of variable as character

get_pkg_globals <- function(varName) {

  # check pkg_globals exists
  if(!exists('pkg_globals')) stop ('Package-global environment does not exist')

  # read from pkg_globals
  val = get(varName, envir=pkg_globals)

  val

}

