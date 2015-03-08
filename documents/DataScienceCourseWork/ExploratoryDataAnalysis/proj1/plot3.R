df <- data.frame(read.table("household_power_consumption_SelectedDates.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss"))
df$DateTime <- strptime(paste(df$Date,df$Time,sep=","), format="%d/%m/%Y,%H:%M:%S")

ggplot(df, aes(x=DateTime)) + 
       geom_line(aes(y = Sub_metering_1)) + 
       geom_line(aes(y = Sub_metering_2), colour = "red") + 
       geom_line(aes(y = Sub_metering_3), colour = "blue") + 
       ylab(label="Energy sub metering") + 
       xlab("Date")
