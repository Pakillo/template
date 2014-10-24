## template package

### Generic template for research projects structured as R packages.

This package works as a template for new research projects, 
under the idea of having everything (data, R scripts, functions
and manuscripts) contained in the same package to facilitate collaboration 
and promote reproducibility.


### How to use it:


1. In RStudio, create new project from version control (clone Git repository). The repository url is `https://github.com/Pakillo/template`. Choose your project name and folder location.

2. Update `DESCRIPTION` file and `template-package.R` with the name and info of your research project.

3. Place original (raw) data (e.g. in csv or txt format) in `inst/extdata`.

4. If you write custom functions for the analyses, place them in `R` folder. 
Document all your functions with roxygen (see http://r-pkgs.had.co.nz/man.html). 
Write tests for your functions (see http://r-pkgs.had.co.nz/tests.html) and place them in `tests` folder.

5. Save all R scripts used for data preparation in the `data-raw` folder.

6. Save final (clean, tidy) datasets in `.rda` format (using `save`) in the `data` folder.
Write documentation for these data following the template in `R/dataset.R`. See http://r-pkgs.had.co.nz/data.html#documenting-data.

7. Choose an Rmarkdown template (e.g. from [rmdTemplates](https://github.com/Pakillo/rmdTemplates) or [rticles](https://github.com/rstudio/rticles) packages) or create your own Rmd document and place it in the `vignettes` folder. Remember that this Rmd document must include info about knitr as the vignette engine, i.e. this bit:  
+<!--  
+%\VignetteEngine{knitr}  
+%\VignetteIndexEntry{Vignette title}  
+-->

8. Press the Knit button or use devtools::build_vignettes() to render the report.

9. Use RStudio build menu to create/update documentation, run tests, build package, etc.

10. Distribute the package.



### Thanks to:

* Carl Boettiger and his [template package](https://github.com/cboettig/template)
* Jeff Hollister and his [manuscriptPackage](https://github.com/jhollist/manuscriptPackage)
* Robert Flight: http://rmflight.github.io/posts/2014/07/analyses_as_packages.html
* Developers at Rstudio involved in knitr, rmarkdown...


