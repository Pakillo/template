#' template package
#'
#' Generic template for research projects structured as R packages.
#' This package works as a template for new research projects,
#' under the idea of having everything (data, R scripts, functions and manuscripts)
#' contained in the same package to promote reproducibility.
#'
#' @name template
#' @docType package
#' @author Francisco Rodriguez-Sanchez
#' @keywords package
#' @details
#' How to use this package:
#'
#' 1. Clone or download zip file of this repository. Unzip.
#'
#' 2. Choose a name for your project.
#'
#' 3. Change the name of the package in `DESCRIPTION` file and `template-package.R` to your chosen name.
#'
#' 4. Place original (raw) data (e.g. in csv or txt format) in `inst/extdata`.
#'
#' 5. If you write custom functions for the analyses, place them in `R` folder.
#' Write tests for your functions (see \url{http://r-pkgs.had.co.nz/tests.html}) and place them in `tests` folder.
#'
#' 6. Save all R scripts used for data preparation in the `data-raw` folder.
#'
#' 7. Save final (clean, tidy) datasets in `.rda` format (using `save`) in the `data` folder.
#'
#' 8. Choose an Rmarkdown template (e.g. from \url{https://github.com/Pakillo/rmdTemplates} or
#' \url{https://github.com/rstudio/rticles} packages) or create your own Rmd document
#' and place it in the `vignettes` folder.
#'
#' 9. Press the Knit button or use \code{devtools::build_vignettes()} to render the report.
#'
NULL
