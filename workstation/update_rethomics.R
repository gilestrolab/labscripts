# this is a simple script to keep rethomics up to date on the workstations. Typically run on a cronjob.
# save this file at `/root/update_rethomics.R`
library(devtools)
devtools::install_github("gilestrolab/rethomics",subdir="rethomics")
