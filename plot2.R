## plot2.R
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
png("plot2.png")
with(data, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
