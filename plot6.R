# Extract Baltimore Data
NEIBaltimore <- subset(NEI, fips == "24510")
# Extract Baltimore Data
NEILogAngeles <- subset(NEI, fips == "06037")
# Extract the text "Vehicles" from SCC for using Motor Vehicle data
# Subet the SCC based on that 
sub <- SCC[grep("Vehicle",SCC$EI.Sector, ignore.case = TRUE),]
# Find these SCC in NEIBaltimore
NEIBaltimoreMotor <- NEIBaltimore[which(NEIBaltimore$SCC %in% sub$SCC),]
# Find these SCC in NEILosAngeles
NEILosAngelesMotor <- NEILogAngeles[which(NEILogAngeles$SCC %in% sub$SCC),]
# Emissions Data
emissionsb <- tapply(X = NEIBaltimoreMotor$Emissions, INDEX =  NEIBaltimoreMotor$year, sum, na.rm = TRUE)
emissionsla <- tapply(X = NEILosAngelesMotor$Emissions, INDEX =  NEILosAngelesMotor$year, sum, na.rm = TRUE)
# Extract the years
years <- unique(NEI$year)
par(mfrow = c(1,2))
# Plot the X and Y Componenets
plot(years,log10(emissions), pch = 20, col = "red", xlab = "Time", ylab = " Logarithmic Pollution Baltimore")
# Text for better understanding
text(years - 0.01, log10(emissionsb) - 0.02, as.character(round(log10(emissionsb), digits = 3)))
plot(years,log10(emissionsla), pch = 20, col = "red", xlab = "Time", ylab = " Logarithmic Pollution LosAngeles")
# Text for better understanding
text(years - 0.01, log10(emissionsla) - 0.02, as.character(round(log10(emissionsla), digits = 3)))
title(main = "Plot 5: Total Emission for Baltimore City and Los Angeles for Motor Vehicles")