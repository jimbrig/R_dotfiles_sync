
# Set Global CRAN Mirror
options(repos = c(CRAN = 'https://cloud.r-project.org'))

# install packages in parallel via 'Ncpus' argument
options(Ncpus = 2L)

# Remove Scientific Notation
options(scipen = 999)

# Set max print
options(max.print = 100)

# set default browser (see ?browseURL)
options(browser = "C:/Program Files/Firefox Nightly/firefox.exe")

# set default editor to notepad
options(editor = "notepad")

# set default pager to internal
options(pager = "internal")

# default to launching shiny apps in external browser
if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::hasFun("viewer")) {
  options(shiny.launch.browser = .rs.invokeShinyWindowExternal)
}

# rcli
if (nzchar(Sys.getenv("R_CMD")) && require("rcli", quietly = TRUE)) rcli::r_cmd_call()

# Update R Prompt
if (interactive()) invisible(installr::check.for.updates.R(GUI = FALSE))

# error tracing
if ('rlang' %in% loadedNamespaces()) options(error = rlang::entrace)

# turn on completion of installed package names
utils::rc.settings(ipck = TRUE)

# Secret Environment Variables/Tokens
local({
  if (!file.exists("~/.R/secrets.Renviron")) {
    secrets <- yaml::read_yaml("~/.R/config.yml")
    if (!require(gistr)) {
      suppressMessages(
        utils::download.file(secrets$url, secrets$local_path, quiet = TRUE)
      )
    } # else {
      # gistr::gist_save(secrets$local_path, secrets$ _gist_path)
    # }
  }
})

readRenviron("~/.R/secrets.Renviron")

# ORCID
options("orcid" = "0000-0002-7489-8787")

# Projects Directory
options("projects.dir" = tools::file_path_as_absolute("~/Dev/sandbox"))

# usethis / devtools
options(
  usethis.full_name = "Jimmy Briggs",
  usethis.protocol = "ssh",
  usethis.description = list(
    `Authors@R` = 'person(
      "Jimmy", "Briggs",
      email = "jimbrig2011@outlook.com",
      role = c("aut", "cre"),
      comment = c(ORCID = "0000-0002-7489-8787"
    ))',
    License = "MIT + file LICENSE",
    Language =  "en-US"
  )
)

# blogdown - https://bookdown.org/yihui/blogdown/global-options.html
options(
  blogdown.author = "Jimmy Briggs",
  blogdown.ext = ".Rmd",
  blogdown.insertimage.usebaseurl = TRUE
)

# addinit
options(
  "addinit" = list(
    author = "Jimmy Briggs",
    project = list(
      folders = list(
        default = c("R", "inst", "man", "data-raw", "data", "tests", "vignettes", "cache", "admin", "config", "docs", "src", "inst/app", "inst/docs", "inst/scripts"),
        selected = c("R", "inst", "man", "data-raw", "data", "tests", "vignettes")
      ),
      packages = list(
        default = rownames(utils::installed.packages()),
        selected = c( "devtools", "usethis", "knitr", "roxygen2", "testthat", "dplyr", "magrittr", "tidyr", "purrr", "lubridate", "shiny", "shinydashboard")
      ),
      config = TRUE,
      source_funs = FALSE
    ),
    shiny_app = list(
      folders = list(
        default = c("R", "man", "data-raw", "data", "inst/app/www", "tests", "vignettes", "cache", "admin", "config", "docs", "src", "inst/docs", "inst/scripts"),
        selected = c("R", "inst/app/www", "man", "data-raw", "data", "tests", "vignettes")
      ),
      packages = list(
        default = rownames(utils::installed.packages()),
        selected = c( "devtools", "usethis", "knitr", "roxygen2", "testthat", "dplyr", "magrittr", "tidyr", "purrr", "lubridate", "shiny", "shinydashboard")
      ),
      config = TRUE,
      source_funs = TRUE
    )
  )
)

# clear env
rm(list = ls())

# load pipe from magrittr
local({
  `%>%` <- magrittr::`%>%`
})

# attach extra helper functions
.env <- new.env()
sys.source("~/.R/rprofile_extras.R", .env)
attach(.env)

# end message

# cleanup
# detach all attached
detach_all_attached()
