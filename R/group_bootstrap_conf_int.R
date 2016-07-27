

#' Compute univariate bootstrap statistic for each group
#' 
#' This functions computes an arbitrary statistic (e.g. mean, median, variance) on bootstrap replicates for each level of a grouping variable.
#'
#' @param y The variable of interest
#' @param data The data.table containing the data. It must have a column with the same name as y.
#' @param group the grouping variable (a factor, integer, or character vector).
#' @param FUN the statistics to compute (it should take a single argument)
#' @param R the number of replicates
#' @param conf the confidence interval
#' @return A data.table object summarising the results
#' @details the return data table contains a column for the statistics computed on \code{y}, one for the corresponing \code{group} 
#' and a two columns, for the upper and lower confidence intetrvals, respectively.

#' @examples
#' library(boot)
#' library(data.table)
#' library(ggplot2)
#' data(iris)
#' # compares mean between groups
#'ci_dt_mean <- groupBootstrapCI(Sepal.Length, iris, Species, R=1000)
#' pl <- ggplot(ci_dt_mean, aes(Species,Sepal.Length))+ geom_bar(stat="identity")+
#'     geom_errorbar(aes(min=low_ci, max=high_ci), width = 0.25)
#' pl
#' # compares variance between groups
#' ci_dt_var <- groupBootstrapCI(Sepal.Length, iris, Species, R=10000, FUN= var)
#' # we can just use the same plot, but change the data
#' pl %+% ci_dt_var
#' @seealso \code{\link{boot::boot}} 
groupBootstrapCI<- function(y, data,  group, FUN=mean, R=1e4, conf=0.95){
  dt <- copy(as.data.table(data))
  
  y_var_name <- deparse(substitute(y))
  setnames(dt,y_var_name,"y")
  group_var_name <- deparse(substitute(group))
  setnames(dt,group_var_name,"group")
    
  
  fun_to_boot <- function(data, w){
	data[w][,.(y = FUN(y)), by=group][,y]
  }
  summary_dt <- dt[,.(y = FUN(y)), by=group]
  n <- nrow(summary_dt)
  boot_summary <- boot(dt, fun_to_boot, R=R, strata=dt[, group])  
  ci <- sapply( 1:n,function(x) boot.ci(boot_summary, type="basic", index=x, conf=conf)$basic[4:5])
  summary_dt[, low_ci := ci[1,]]
  summary_dt[, high_ci := ci[2,]]
  setnames(summary_dt, "y", y_var_name)
  setnames(summary_dt, "group", group_var_name)
  rm(dt)
  gc()
  summary_dt
}
