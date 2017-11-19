# Extract Baltimore Data
NEIBaltimore <- subset(NEI, fips == "24510")
#Extract the sum of emissions
emissions <- tapply(X = NEIBaltimore$Emissions, INDEX =  NEIBaltimore$year, sum, na.rm = TRUE)
# Extract the years
years <- unique(NEI$year)
# Plot the X and Y Componenets
plot(years,log10(emissions), pch = 20, col = "red", xlab = "Time", ylab = "Logarithmic Pollution")
# Text for better understanding
text(years - 0.01, log10(emissions) - 0.02, as.character(round(log10(emissions), digits = 3)))
title(main = "Plot 2: Total Emission for Baltimore City")