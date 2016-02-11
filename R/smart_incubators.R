rm(list = ls(all = TRUE)) 

library(data.table)
library(ggplot2)

URL <- "ftp://etho-node.lab.gilest.ro/ardufly-data/smart_incubator.csv"

#' Unix time stammp to UTC date
asDateTime <- function(unixts){
  as.POSIXct(unixts, origin="1970-01-01",tz = "UTC")
}

readIncubatorFile <- function(file){
  # directly load data from ftp!
  dt <- fread(file)
  #change unix time stamp to date objects
  dt[, device_time:=asDateTime(device_time)]
  dt[, server_time:=asDateTime(server_time)]
  dt[, t:=device_time]
  dt
}


dt <- readIncubatorFile(URL)
# just a few exemples, showing one variable vs time one facet per incubator
# show temperature
ggplot(dt,aes(t, temperature)) + geom_line() + geom_point() + facet_grid(id ~ .)

#show_light
ggplot(dt,aes(t, light)) + geom_line() + geom_point() + facet_grid(id ~ .)






