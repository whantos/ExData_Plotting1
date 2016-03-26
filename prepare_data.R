library(data.table)
library(httr)

prepareData <- function() {
    srcFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    targetFile = "data/household_power_consumption.zip"
    
    if(!dir.exists("data")) { dir.create("data") }
    if(!file.exists(targetFile)) {
        download.file(srcFile,targetFile) 
        unzip(targetFile, exdir = "data")
    }
    #### 2) Read and Filter the Data
    
    allData <- fread("data/household_power_consumption.txt", na.strings = "?")
    allData <- allData[Date %in% c("1/2/2007","2/2/2007"),]
    dateAndTime <- strptime(paste(allData$Date, allData$Time, sep=''), "%d/%m/%Y %H:%M:%S" )
    allData$Time <- as.POSIXct(dateAndTime) # data.table does not support Posixlt ...
    allData$Date <- as.Date(allData$Date,"%d/%m/%Y")
    allData
}