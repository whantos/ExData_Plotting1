source("./prepare_data.R")

####  Get the Data
allData <- prepareData()

####  create and save the Plot
## Open an PNG Device
png(file = "plot1.png", height = 480, width = 480)
with(allData, hist( Global_active_power
                    , main = "Global Active Power"
                    , xlab = "Global Active Power (kilowatts)"
                    , ylab = "Frequency"
                    , col  = "red")
    )
## Close the Device
dev.off()
