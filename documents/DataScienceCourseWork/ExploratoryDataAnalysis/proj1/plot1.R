df <- data.frame(read.table("household_power_consumption_SelectedDates.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss"))
df$DateTime <- strptime(paste(df$Date,df$Time,sep=","), format="%d/%m/%Y,%H:%M:%S")
hist (df$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

