# pkg2date.R
# scipt to update the package
# 2016-05-18
# Kevin Cazelles

args <- commandArgs(trailingOnly = TRUE)

## change working directory
setwd(args[1])

## update README / documentation
decoreq <- function(nb) paste(rep("=",nb), collapse="")
decor <- function(){
  cat("DONE", decoreq(75), "\n")
}

##
cat(decoreq(35), " START ", decoreq(36), "\n\n")

if (!as.numeric(args[2])) {
  ##
  rmarkdown::render("README.Rmd", "all", quiet=TRUE)
} else {
  ## format the code
  cat("tidying ........\n")
  formatR::tidy_dir("./R")
  formatR::tidy_dir("./tests/test_that")
  decor()
  ## load the package
  cat("loading ........\n")
  devtools::load_all(".")
  decor()
  ## document the package
  cat("documenting ....\n")
  devtools::document(".")
  decor()
  ## testing the code
  cat("testing ........\n")
  devtools::test()
  #decor()
  ## recording update
  cat(date(), "   DONE \n", file = "record_updates.txt", append=TRUE)
}
