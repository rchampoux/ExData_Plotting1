## plot4.R
## Course Project 1 for Exploratory Data Analysis
##
## Downloads and unzips data
## Loads data; reformatting and subsetting as necessary
## Constructs required plot
## Saves to PNG file

# Download and unzip data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzippedFilepaths <- unzip("household_power_consumption.zip")

# Read in data, create datetime column, and subset
allData <- read.csv(unzippedFilepaths[1], sep = ";", na.strings="?", colClasses = c(rep("character", 2), rep("numeric", 7)))
allData$datetime <- as.POSIXct(paste(allData$Date, allData$Time), format="%d/%m/%Y %H:%M:%S")
data <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"),]

# Construct plot and send to PNG file
png("plot4.png")
par(mfcol = c(2, 2))
with(data, {
        plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
        
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        points(datetime, Sub_metering_2, type = "l", col = "red")
        points(datetime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = 
                       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), bty = "n")
        
        plot(datetime, Voltage, type = "l")
        
        plot(datetime, Global_reactive_power, type = "l")
})
dev.off()
