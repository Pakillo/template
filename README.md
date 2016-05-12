## `template` package

### Generic template for research projects structured as R packages.

[![Travis-CI Build Status](https://travis-ci.org/Pakillo/template.svg?branch=master)](https://travis-ci.org/Pakillo/template)

[Rmarkdown](http://rmarkdown.rstudio.com/index.html) documents are great to keep 
reproducible scientific workflows, tightly integrating code, results and text. 
Reports created with Rmarkdown can even [include embedded data](http://bayesfactor.blogspot.com.es/2014/09/embedding-rdata-files-in-rmarkdown.html) or [the Rmarkdown source code itself](http://rpubs.com/ramnathv/including_rmd_source). I keep a collection of Rmarkdown templates [here](https://github.com/Pakillo/rmdTemplates).

However, once we are dealing with large or several datasets, and writing custom code and functions,
[the best way to structure our projects is probably in the form of R packages](http://rmflight.github.io/posts/2014/07/analyses_as_packages.html). 

Hence this package works as a template for new research projects, 
with the idea of having everything (data, R scripts, functions
and manuscripts reporting results) contained in the same package 
to facilitate collaboration and promote reproducibility.


### How to use this template:

You can install the package using `devtools::install_github("Pakillo/template", dependencies = TRUE)`, but installation is not required if using this simply as a template for new projects. It is important, however, to check that at least `knitr`, `rmarkdown` and `devtools` are properly installed to run the whole workflow. I outline the basic steps below:


1. In RStudio, create new project from version control (clone Git repository). The repository url is `https://github.com/Pakillo/template`. Choose your project name and folder location.

2. Go to `Project Options` in RStudio and check that everything is right. In `Build Tools`, check `Generate documentation with Roxygen` in all cases (turn on all options). Here you can also stop using `git` for version control, or start using [`packrat`](http://rstudio.github.io/packrat/) (to ensure that your results will be reproducible in the future). If you want to start with a clean `git` record, just delete the `.git` folder in your computer. Then you will have to add to `git` all the files you would like to track.

3. Important: if using `git`, remember to change the remote repository (i.e. remove `https://github.com/Pakillo/template` as remote!). You can do this from the shell: `git remote set-url origin git@github.com:your_username/your_project.git`. Just substitute `your_username` by your Github username and `your_project.git` by the name of your new GitHub repository.

4. Update `README.md`, the `DESCRIPTION` file and `template-package.R` with the name and info of your research project.  

5. Place original (raw) data (e.g. in csv or txt format) in `data-raw`. Save all R scripts used for data preparation in the same `data-raw` folder.

6. Save final (clean, tidy) datasets in `.rda` format (using `save` or `saveRDS`) in the `data` folder.
Write documentation for these data following the template in `R/dataset.R` (see http://r-pkgs.had.co.nz/data.html#documenting-data). If you would like to keep a copy of the clean data in 'plain-text' format (e.g. txt, csv) (more accesible outside R) you can place them in `inst/extdata`.

7. Analyse the data using Rmarkdown documents stored in the `analyses` folder.

8. If you write custom functions for the analyses, place them in `R` folder. 
Document all your functions with `Roxygen` (see http://r-pkgs.had.co.nz/man.html). 
Write tests for your functions (see http://r-pkgs.had.co.nz/tests.html) and place them in `tests` folder.
If your analysis uses functions from other CRAN packages, include these packages in `Imports` in the `DESCRIPTION` file. Also use `@import` or `@importFrom` as `Roxygen` parameters in the function definitions to import these dependencies in the namespace.

9. For the final manuscript/report, choose an Rmarkdown template (e.g. from [rmdTemplates](https://github.com/Pakillo/rmdTemplates) or [rticles](https://github.com/rstudio/rticles)) or create your own Rmd document and place it in the `manuscript` folder. 

10. Press the `Knit` button or use `rmarkdown::render` to render the report.

11. Use RStudio `Build` menu to create/update documentation, run tests, build package, etc.




### Thanks to:

* Carl Boettiger and his [template package](https://github.com/cboettig/template)
* Jeff Hollister and his [manuscriptPackage](https://github.com/jhollist/manuscriptPackage)
* Robert Flight: http://rmflight.github.io/posts/2014/07/analyses_as_packages.html
* Hadley Wickham: http://r-pkgs.had.co.nz/
* Yihui Xie: http://yihui.name/knitr/
* Developers at Rstudio involved in knitr, rmarkdown, and RStudio itself!


### Links

* https://github.com/ropensci/rrrpkg
* https://github.com/Reproducible-Science-Curriculum/rr-init
* http://ropensci.github.io/reproducibility-guide/

