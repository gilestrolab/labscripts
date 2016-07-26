# This file contains our conventions to represent ggplot graphs in the lab.
# Ideally, you will save it in your workspace, and source it (`source(ggplot_themes.R)`)
# then, you can simply add themes to plots. For instance:
## make the plot:
# `pl <- ethogramPlot(...)`
# # change theme and show:
# `pl + ethogram_theme`

# This is designed to for pdf of size 8x6 inches. 
# So, unless you have a good reason to use a different size, you can do:
# `pdf("my_file_name.pdf", w=8,h=6)`
# `do stuf...`
# `dev.off`

ethogram_theme <- theme_bw() + theme(	 axis.text = element_text(size = 12),
					 panel.grid.major = element_line(colour = "grey80"),
					 panel.grid.major.x =element_blank(),
					 panel.grid.minor = element_blank(),
					 legend.position = "bottom",
					 legend.title =element_blank())


# this theme is for generic scatterplots, boxplot, barplot...
generic_theme <- theme_bw()+ theme( 	axis.text = element_text(size = 12),
					axis.title=element_text(size=14),
					axis.title=element_text(size=14),
					axis.text.x = element_text(angle=60, vjust=1.1, hjust=1),
					panel.grid.major = element_line(colour = "grey80"),
					panel.grid.major.x =element_blank(),
					panel.grid.minor = element_blank(),
					legend.position = "none")
