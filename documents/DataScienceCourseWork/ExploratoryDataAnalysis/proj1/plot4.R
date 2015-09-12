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

# generate plots
  png(filename="plot4.png", width=480, height=480) 
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
  
#plot 1
  with(dfPowerConsumption[with(dfPowerConsumption, order(DateTime)),],plot(DateTime,Global_active_power,xlab="",ylab = "Global Active Power",type="l"))

#plot 2
  with(dfPowerConsumption[with(dfPowerConsumption, order(DateTime)),],plot(DateTime,Voltage,ylab = "Voltage",type="l"))

#plot 3
  plot(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") 
  lines(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_2, col="red") 
  lines(dfPowerConsumption$DateTime, dfPowerConsumption$Sub_metering_3, col="blue") 
  legend("topright", cex=0.8, pt.cex = 0.8, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lwd=par("lwd"),bty = "n")

#plot 4
  with(dfPowerConsumption[with(dfPowerConsumption, order(DateTime)),],plot(DateTime,Global_reactive_power,type="l"))
  
  dev.off()

