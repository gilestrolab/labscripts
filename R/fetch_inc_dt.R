rm(list = ls(all = TRUE))

library(data.table)
library(ggplot2)
library(RMySQL)

mydb = dbConnect(MySQL(), user='incubators', password='incubators', dbname='incubators', host='etho-node.lab.gilest.ro')

asDateTime <- function(unixts){
  as.POSIXct(unixts, origin="1970-01-01",tz = "UTC")
}

fetchIncubatorData <- function(db, since="1970-01-01 00:00:00", to=NULL){
  if(is.null(to)){
    to <- as.character(Sys.time())
  }
  
  since <- paste("'", since, "'")
  to <- paste("'", to, "'")
  query <- paste("SELECT * FROM incubators WHERE device_time  BETWEEN", since, "AND", to)
  rs =dbSendQuery(db, query)
  data = fetch(rs, n=-1)
  dt <- data.table(data)
  dt[, device_time:=asDateTime(device_time)]
  dt[, t:=device_time]
}


my_dt <- fetchIncubatorData(mydb, since = "2016-07-29")

ggplot(my_dt,aes(t, temperature)) + geom_line() + geom_point() + facet_grid(id ~ .)

ggplot(my_dt,aes(t, light)) + geom_line() + geom_point() + facet_grid(id ~ .)

