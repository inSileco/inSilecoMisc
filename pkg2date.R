# pkg2date.R
# scipt to update the package
# 2016-05-18
# Kevin Cazelles

args <- commandArgs(trailingOnly = TRUE)

## change working directory
setwd(args[1])

## update README / documentation
if (!as.numeric(args[2])) {
  ##
  rmarkdown::render("README.Rmd", "all", quiet=TRUE)
} else {
  ## format the code
  cat("tidy ........")
  formatR::tidy_dir("./R")
  cat("DONE\n")
  ## load the package
  cat("load ........")
  devtools::load_all(".")
  cat("DONE\n")
  ## document the package
  cat("document .... DONE")
  devtools::document(".")
  cat("DONE\n")
  ## recording update
  cat(date(), "   DONE \n", file = "record_updates.txt", append=TRUE)
}
