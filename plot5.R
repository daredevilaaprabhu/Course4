# Extract Baltimore Data
NEIBaltimore <- subset(NEI, fips == "24510")
# Extract the text "Vehicles" from SCC for using Motor Vehicle data
# Subet the SCC based on that 
sub <- SCC[grep("Vehicle",SCC$EI.Sector, ignore.case = TRUE),]
# Find these SCC in NEIBaltimore
NEIBaltimoreMotor <- NEIBaltimore[which(NEIBaltimore$SCC %in% sub$SCC),]
# Emissions Data
emissions <- tapply(X = NEIBaltimoreMotor$Emissions, INDEX =  NEIBaltimoreMotor$year, sum, na.rm = TRUE)
# Extract the years
years <- unique(NEI$year)
# Plot the X and Y Componenets
plot(years,log10(emissions), pch = 20, col = "red", xlab = "Time", ylab = " Logarithmic Pollution")
# Text for better understanding
text(years - 0.01, log10(emissions) - 0.02, as.character(round(log10(emissions), digits = 3)))
title(main = "Plot 5: Total Emission for Baltimore City for Motor Vehicles")