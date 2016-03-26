source("./prepare_data.R")

####  Get the Data
allData <- prepareData()

####  create and save the Plot

myLocale <- Sys.getlocale("LC_TIME") # save originale Locale
Sys.setlocale("LC_TIME", "English") # set to englisch for the X-Labels

## Open an PNG Device
png(file = "plot2.png", height = 480, width = 480)
with(allData, plot( Global_active_power ~ Time
                    , main = ""
                    , ylab = "Global Active Power (kilowatts)"
                    , xlab = ""
                    , col  = "black"
                    , typ = "l")
)
## Close the Device
dev.off()
Sys.setlocale("LC_TIME", myLocale) # restore the Locale