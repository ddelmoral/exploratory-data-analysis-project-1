# Coursera - Exploratory Data Analysis - Course Project Assignment 1 
# By David del Moral
# November 5, 2017
#
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
data <- read.table(dataFileName, header=TRUE, sep=";", stringsAsFactors=FALSE)
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()