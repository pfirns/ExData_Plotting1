rm(list=ls())
setwd("C:/Users/pete/Documents/DataScienceCourseWork/ExploratoryDataAnalysis/Proj1")

# Read Power consumption data into dataframe named powerConsumption and create DateTime column
dfPowerConsumption <- data.frame(read.table("household_power_consumption.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss", stringsAsFactors=F, na.strings="?",colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric")))

# Create dataframe comprising required dates
  selectedDates <- data.frame(Date = c("1/2/2007", "2/2/2007"))

# merge the two data frames into df - subsetting the consumption data by selected dates
dfPowerConsumption <- data.frame(merge(dfPowerConsumption,selectedDates,dfPowerConsumption="Date",by.selectedDates="Date"))

# generate plot
  png(filename="plot1.png", width=480, height=480) 
  hist (dfPowerConsumption$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
