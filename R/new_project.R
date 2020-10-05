
#' Create new project scaffolding
#'
#' Create all the scaffolding for a new project in a new directory. The scaffolding includes a README file, different folders to hold raw data, analyses, etc, and optionally also \code{testthat} infrastructure. Also, optionally, set a private or public GitHub repo with continuous integration (Travis-CI, GitHub Actions...).
#'
#' @param name Character. Name of the new project. Could be a path, e.g. \code{"~/myRcode/newproj"}. A new folder will be created with that name.
#' @param github Logical. Create GitHub repository? Note this requires some working infrastructure like \code{git} and a \code{GITHUB_PAT}. See instructions here \url{https://usethis.r-lib.org/articles/articles/usethis-setup.html}.
#' @param private.repo Logical. Default is TRUE.
#' @param ci Logical. Use continuous integration in your GitHub repository? Current options are "none" (default), "travis" (uses Travis-CI), "circle" (uses Circle-CI), "appveyor" (uses AppVeyor), or "gh-actions" (uses GitHub Actions).
#' @param makefile Logical. If TRUE, adds a template \code{makefile.R} file to the project.
#' @param pipe Logical. Use magrittr's pipe in your package?
#' @param testthat Logical. Add testthat infrastructure?
#' @param verbose Print verbose output in the console while creating the new project? Default is FALSE.
#' @param open.project Logical. If TRUE (the default) will open the newly created Rstudio project in a new session.
#'
#' @return A new directory with R package structure, slightly modified.
#' @export
#' @details If using github = TRUE, you will be asked if you want to commit some files. Reply positively to continue.
#'
#' @examples
#' \dontrun{
#' library("template")
#' new_project("myproject")
#' new_project("myproject", github = TRUE, private.repo = TRUE)
#' }
new_project <- function(name,
                        github = FALSE, private.repo = TRUE, ci = "none",
                        makefile = TRUE, pipe = TRUE, testthat = FALSE,
                        verbose = FALSE, open.project = TRUE){

  if (!isTRUE(verbose)) {
    options(usethis.quiet = TRUE)
  }

  usethis::create_package(name, open = FALSE)
  usethis::proj_set(name, force = TRUE)

  usethis::use_package_doc(open = FALSE)
  usethis::use_readme_rmd(open = FALSE)
  usethis::use_data_raw(open = FALSE)

  if (isTRUE(pipe)) {
    usethis::use_pipe()
  }

  if (isTRUE(testthat)) {
    usethis::use_testthat()
  }

  # Add folders
  dir.create(file.path(name, "data"))
  dir.create(file.path(name, "analyses"))
  dir.create(file.path(name, "manuscript"))

  # Add makefile.R
  if (isTRUE(makefile)) {
    file.copy(from = system.file("makefile", "makefile.R", package = "template"),
              to = usethis::proj_get())
  }


  usethis::use_build_ignore(c("analyses", "manuscript", "makefile.R"))


  if (isTRUE(github)) {
    usethis::use_git()
    usethis::use_github(private = private.repo)
    # usethis::use_github_links(name)

    ## Continuous integration services
    stopifnot(ci %in% c("none", "travis", "gh-actions", "circle", "appveyor"))

    if (ci == "travis") {
      usethis::use_travis()
      #usethis::use_travis_badge()
    }

    if (ci == "gh-actions") {
      usethis::use_github_actions()
      # usethis::use_github_action_check_release()
      #usethis::use_github_actions_badge()
    }

    if (ci == "circle") {
      usethis::use_circleci()
    }

    if (ci == "appveyor") {
      usethis::use_appveyor()
    }

  }

  # Open Rstudio project in new session at the end?
  if (isTRUE(open.project)) {
    if (rstudioapi::isAvailable()) {
      rstudioapi::openProject(name, newSession = TRUE)
    }
  }


}
