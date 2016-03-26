source("./prepare_data.R")

####  Get the Data
allData <- prepareData()

####  create and save the Plot

myLocale <- Sys.getlocale("LC_TIME") # save originale Locale
Sys.setlocale("LC_TIME", "English") # set to englisch for the X-Labels

## Open an PNG Device
png(file = "plot3.png", height = 480, width = 480)
with(allData,  {
    plot( Sub_metering_1 ~ Time, main = ""
          , ylab = "Energie sub metering", xlab = ""
          , col  = "black", typ = "l")
    lines( Sub_metering_2 ~ Time, col = "red", typ = "l")
    lines( Sub_metering_3 ~ Time, col = "blue", typ = "l")
    legend("topright", lwd = 2, col = c("black","red", "blue")
           , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
}
)
## Close the Device
dev.off()
Sys.setlocale("LC_TIME", myLocale) # restore the Locale