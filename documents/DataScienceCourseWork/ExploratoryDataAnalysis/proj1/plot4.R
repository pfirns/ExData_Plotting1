df <- data.frame(read.table("household_power_consumption_SelectedDates.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss"))
df$DateTime <- strptime(paste(df$Date,df$Time,sep=","), format="%d/%m/%Y,%H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
with(df[with(df, order(DateTime)),],plot(DateTime,Global_active_power,ylab = "Global Active Power",type="l"))
with(df[with(df, order(DateTime)),],plot(Voltage,ylab = "Voltage",type="l"))
with(df[with(df, order(DateTime)),],plot(Sub_metering_3,ylab = "Energy sub metering",type="l"))
with(df[with(df, order(DateTime)),],plot(Global_reactive_power,type="l"))
