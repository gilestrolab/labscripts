# This file contains our conventions to represent ggplot graphs in the lab.
# Ideally, you will save it in your workspace, and source it (`source(ggplot_themes.R)`)
# then, you can simply add themes to plots. For instance:
## make the plot:
# `pl <- ethosgramPlot(...)`
# # change theme and show:
# `pl + ethogram_theme`

ethogram_theme <- theme_bw() + theme(	axis.text = element_text(size = 12),
					 panel.grid.major = element_line(colour = "grey80"),
					 panel.grid.major.x =element_blank(),
					 panel.grid.minor = element_blank(),
					 legend.position = "bottom",
					 legend.title =element_blank())
