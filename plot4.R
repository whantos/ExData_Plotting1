source("./prepare_data.R")

####  Get the Data
allData <- prepareData()

####  create and save the Plot

myLocale <- Sys.getlocale("LC_TIME") # save originale Locale
Sys.setlocale("LC_TIME", "English") # set to englisch for the X-Labels

## Open an PNG Device
png(file = "plot4.png", height = 480, width = 480)
# Define 4 Tiles for Plots
par(mfrow = c(2,2))
with(allData,  {
    # Plot 1
    plot( Global_active_power ~ Time, main = ""
                        , ylab = "Global Active Power", xlab = ""
                        , col  = "black", typ = "l")
    # Plot2
    plot( Voltage ~ Time, main = ""
          , ylab = "Voltage", xlab = "datetime"
          , col  = "black", typ = "l")
    # Plot 3
    plot( Sub_metering_1 ~ Time, main = ""
          , ylab = "Energie sub metering", xlab = ""
          , col  = "black", typ = "l")
    lines( Sub_metering_2 ~ Time, col = "red", typ = "l")
    lines( Sub_metering_3 ~ Time, col = "blue", typ = "l")
    legend("topright", lwd = 2, col = c("black","red", "blue")
           , legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
           , bty = "n")
    # Plot 4
    plot( Global_reactive_power ~ Time, main = ""
          , ylab = "Global_reactive_power", xlab = "datetime"
          , col  = "black", typ = "l")
    
}
    )
## Close the Device
dev.off()
Sys.setlocale("LC_TIME", myLocale) # restore the Locale