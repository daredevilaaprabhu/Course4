myplot <- function(val = 1) 
{
  
  dev.copy(png, height = 480, width = 480,paste("plot", as.character(val), ".png", sep = ""))
  dev.off()
}