
#### Template of a master script for the project ####

## Using an advanced tool like {drake} or {targets} is recommended,
## but this can work as a simple alternative.


### if you have written specific functions in R/, load the package:
# library("myproject")


### Source data cleaning scripts
# source("data-raw/datacleaning.R")
### Could also be Rmarkdown:
# rmarkdown::render("data-raw/datacleaning.Rmd")


### Render manuscript
# rmarkdown::render("manuscript/ms_project.Rmd")


## Check your code ##
# goodpractice::gp()



#### Control package dependencies ####

# Many alternatives available, for example:

# sessionInfo()

# automagic::make_deps_file()

# Or using renv:
# renv::init()
# renv::snapshot()

# Or use Docker, see e.g. {containerit} or {liftr}


## Make a website for your project?
## see https://pkgdown.r-lib.org/
# usethis::use_pkgdown()
# pkgdown::build_site()

