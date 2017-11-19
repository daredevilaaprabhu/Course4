# Extract Baltimore Data
NEIBaltimore <- subset(NEI, fips == "24510")
if("dplyr" %in% rownames(installed.packages()) == FALSE) {install.packages("dplyr")}
library(dplyr)
newDT <- NEIBaltimore %>% group_by( type, year ) %>% summarize(sumary = sum(Emissions))
if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}
library(ggplot2)
qplot(year, summary, data = newTB, facets = .~type, geom = c("line"), xlab = "Year", ylab = "Emission", main = "Plot 3: Emission in Baltimore for 4 years for each source")