## `template` package

### Generic template for research projects structured as R packages.

[Rmarkdown](http://rmarkdown.rstudio.com/index.html) documents are great to keep 
reproducible scientific workflows, tightly integrating code, results and reporting. 
Rmarkdown documents can even [include embedded data](http://bayesfactor.blogspot.com.es/2014/09/embedding-rdata-files-in-rmarkdown.html). I keep a collection of Rmarkdown templates [here](https://github.com/Pakillo/rmdTemplates).
However, once we are dealing with large or several datasets, and writing custom code and functions,
[the best way to structure our projects is probably in the form of R packages](http://rmflight.github.io/posts/2014/07/analyses_as_packages.html). 

Hence this package works as a template for new research projects, 
with the idea of having everything (data, R scripts, functions
and manuscripts reporting results) contained in the same package 
to facilitate collaboration and promote reproducibility.


### How to use this template:

You can install the package using `devtools::install_github("Pakillo/template", dependencies = TRUE)`, but it is not required if using this simply as a template for new projects. It is important, however, to check that at least `knitr`, `rmarkdown` and `devtools` are properly installed to run the whole workflow. I outline the basic steps below:


1. In RStudio, create new project from version control (clone Git repository). The repository url is `https://github.com/Pakillo/template`. Choose your project name and folder location.

2. If you want to stop using git for version control, or use [`packrat`](http://rstudio.github.io/packrat/) to ensure that your results will be reproducible in the future, go to Project options in RStudio. 

3. Update `DESCRIPTION` file and `template-package.R` with the name and info of your research project.  

4. Place original (raw) data (e.g. in csv or txt format) in `inst/extdata`.

5. If you write custom functions for the analyses, place them in `R` folder. 
Document all your functions with `roxygen` (see http://r-pkgs.had.co.nz/man.html). 
Write tests for your functions (see http://r-pkgs.had.co.nz/tests.html) and place them in `tests` folder.
If your analysis uses functions from other CRAN packages, remember to include them in `Imports` in the `DESCRIPTION` file.

6. Save all R scripts used for data preparation in the `data-raw` folder.

7. Save final (clean, tidy) datasets in `.rda` format (using `save`) in the `data` folder.
Write documentation for these data following the template in `R/dataset.R`. See http://r-pkgs.had.co.nz/data.html#documenting-data.

8. Choose an Rmarkdown template (e.g. from [rmdTemplates](https://github.com/Pakillo/rmdTemplates) or [rticles](https://github.com/rstudio/rticles)) or create your own Rmd document and place it in the `vignettes` folder. Remember that this Rmd document must include info about knitr as the vignette engine, i.e. this bit:  
+<!--  
+%\VignetteEngine{knitr}  
+%\VignetteIndexEntry{Vignette title}  
+-->  

9. Press the Knit button or use devtools::build_vignettes() to render the report.

10. Use RStudio `Build` menu to create/update documentation, run tests, build package, etc.

11. Distribute the package.



### Thanks to:

* Carl Boettiger and his [template package](https://github.com/cboettig/template)
* Jeff Hollister and his [manuscriptPackage](https://github.com/jhollist/manuscriptPackage)
* Robert Flight: http://rmflight.github.io/posts/2014/07/analyses_as_packages.html
* Developers at Rstudio involved in knitr, rmarkdown...


