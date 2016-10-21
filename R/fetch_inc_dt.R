rm(list = ls(all = TRUE))

library(data.table)
library(ggplot2)
library(RMySQL)

mydb = dbConnect(MySQL(), user='incubators', password='incubators', dbname='incubators', host='etho-node.lab.gilest.ro')
rs = dbSendQuery(mydb, "select * from incubators")
rs
data = fetch(rs, n=-1)
dt <- data.table(data)



asDateTime <- function(unixts){
  as.POSIXct(unixts, origin="1970-01-01",tz = "UTC")
}


fetchIncubatorData <- function(dt, since="1970-01-01"){
  dt[, device_time:=asDateTime(device_time)]
  dt[, t:=device_time]
  dt[t >= since]
}


my_dt <- fetchIncubatorData(dt, since = "2016-07-30")

ggplot(my_dt,aes(t, temperature)) + geom_line() + geom_point() + facet_grid(id ~ .)

ggplot(my_dt,aes(t, light)) + geom_line() + geom_point() + facet_grid(id ~ .)

