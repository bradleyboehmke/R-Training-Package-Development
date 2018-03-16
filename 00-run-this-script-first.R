###############################
# Setting Up Your Environment #
###############################
# the following packages will be used
list.of.packages <- c(
  "devtools",       # provides R package development tools
  "roxygen2",       # provides tools for simple R package documentation
  "testthat",       # provides tools for integrated R package testing
  "knitr"           # provides tools to create an R package vignette
  )

# run the following line of code to install the packages you currently do not have
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)


#################################
# Prepping for Package Building #
#################################
# for the package development session, if you run Windows, you will need to install
# Rtools from https://cran.r-project.org/bin/windows/Rtools/ (you are likely
# running R v3.3.x or later so you will want to downlad Rtools34.exe).

# Once you have installed Rtools, run the following line of code verify that your 
# system can find Rtools. The response should be a logical value of TRUE
devtools::find_rtools()

# Lastly, run the following line to check if your set up is ready to construct
# R packages.  If the response is TRUE you are golden!  If the response is FALSE
# you likely can still create a package but you might be missing parts of the
# total capabilitiy (i.e. most common error is that you do not have git on your
# computer, this does not keep you from making a package, it just keeps you
# from having version control for your package)
devtools::has_devel()

# See you tomorrow!





