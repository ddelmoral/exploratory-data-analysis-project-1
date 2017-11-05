# Coursera - Exploratory Data Analysis - Course Project Assignment 1 
# By David del Moral
# November 5, 2017
library(datasets)
library(data.table)
# File download
dir<- '~/Personal/Learning/Exploratory Data Analysis/project1/'
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName <- "household_power_consumption.zip"
setwd(dir)
download.file(fileUrl, destfile=zipFileName)
unzip(zipFileName)
# File subsetting and drawing
dataFileName <- "household_power_consumption.txt"
data <- read.table(dataFileName, header=TRUE, sep=";",stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="", ylim=c(0,40))
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()