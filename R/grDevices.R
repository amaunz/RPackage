#' create plots on all devices 
#' @param plotFun function creating a plot
#' @param title Title for the plot
#' @param pdfHeight The PDF plot height in inches
#' @param pngHeight The PNG plot height in inches
#' @param pngWidth The PNG plot width in inches
#' @param pngRes The PNG resolution in dots per inch
#' @param ... Additional parameters for plotFun

createAllDevPlots <- function(plotFun, title, pdfHeight=NULL, pngHeight=NULL, 
                              pngWidth=NULL, pngRes=NULL, ...) { 
  openPngDevice(title, height=pngHeight, width=pngWidth, res=pngRes)         
  plotFun(...)                 
  closeDevice()                
  openPdfDevice(title, height=pdfHeight)
  plotFun(...)                 
  closeDevice()                
  plotFun(...)                 
}

#' Open PNG device
#' initialize to file name after title
#' @param title the title
#' @param height the plot height in inches
#' @param width the plot width in inches
#' @param res the plot resolution in dots per inch

openPngDevice <- function(title, height=NULL, width=NULL, res=NULL) {
  filePath = file.path(get_pkg_globals('outputPath'), normalizeFilename(paste(title, '.png', sep='')))
  message(paste('Opening PNG device for', filePath))
  if (!is.null(height) && !is.null(width))
    png(filePath, height=height, width=width, units='in', res=res)
  else
    png(filePath)
}

#' Open PDF device
#' initialize to file name after title
#' @param title the title
#' @param height the plot height in inches

openPdfDevice <- function(title, height=NULL) {
  filePath = file.path(get_pkg_globals('outputPath'), normalizeFilename(paste(title, '.pdf', sep='')))
  message(paste('Opening PDF device for', filePath))
  if (!is.null(height))
    pdf(filePath, useDingbats=F, height=height)
  else
    pdf(filePath)
}

#' Close device
closeDevice <- function() {
  message('Device closed')
  dev.off()
}
