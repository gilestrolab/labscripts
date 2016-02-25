#' A function to put multiple ggplot object on a single graph
#' 
#' @param nrow the number of rows in the grid
#' @param ncol the number of columns in the grid
#' @param plots a list of ggplot object
#' @param by_row  whether plots are added by row (default), or by column

multiPlot <- function(nrow, ncol, plots, by_row=FALSE) {
  require(grid)
  if(nrow*ncol<length(plots)) {
    stop("to many plots for this layout")
  }
   vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)
   grid.newpage()
   pushViewport(viewport(layout = grid.layout(nrow, ncol)))
   k <- 1
  if (by_row) {  
    for (i in 1:nrow) {   
      for (j in 1:ncol) {  
        if(k> length(plots)) {
          return()
        }
        my_plot <- plots[[k]]
        print(my_plot, vp = vplayout(i, j))
        k <- k +1
      }
    }
  }
  else{
    for (j in 1:ncol) {   
      for (i in 1:nrow) {  
        if(k> length(plots)) {
          return()
      }
      my_plot <- plots[[k]]
      print(my_plot, vp = vplayout(i, j))
      k <- k +1
    }
  }
    
  }
}
    
  }
}
