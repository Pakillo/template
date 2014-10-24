#' How to document datasets.
#'
#' This is an example showing how to document datasets included in the package (in \code{data} folder):
#' you must specify docType and name; do not forget NULL in the end.
#' Can include other fields, like citation.
#' See \url{http://r-pkgs.had.co.nz/data.html} for further explanations.
#'
#' @docType data
#' @name exampledataset
#' @format A numeric vector.
#' @source This example modified from C. Boettiger's template package \url{https://github.com/cboettig/template}.
#' @examples
#' \dontrun{
#' data(exampledataset)
#' str(exampledataset)
#' }
NULL
