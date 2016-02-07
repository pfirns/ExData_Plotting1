rm(list=ls())
setwd("C:/Users/pete/Documents/DataScienceCourseWork/ExploratoryDataAnalysis/Proj1")

# Read Power consumption data into dataframe named powerConsumption 
dfPowerConsumption <- data.frame(read.table("household_power_consumption.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss", stringsAsFactors=F, na.strings="?",
                                            colClasses=c("character", "character", "numeric","numeric", "numeric", "numeric", "numeric", "numeric", "numeric")))

# Create DateTime column
dfPowerConsumption$DateTime <- strptime(paste(dfPowerConsumption$Date, dfPowerConsumption$Time), format="%d/%m/%Y %H:%M:%S")

# Create start snd end date variables and subset powerConsumption data frame
  startDate <- strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S") 
  endDate <- strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S") 
  dfPowerConsumption <- dfPowerConsumption[dfPowerConsumption$DateTime >= startDate & dfPowerConsumption$DateTime <= endDate, ] 

# generate plot
  png(filename="plot3.png", width=480, height=480) 
  plot(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
  lines(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_2, col="red") 
  lines(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_3, col="blue") 
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col=c("black", "red", "blue"), lwd=par("lwd")) 
  dev.off()
