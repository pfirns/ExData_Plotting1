df <- read.table("household_power_consumption.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss")
df2 <- data.frame(Date = c("1/2/2007","2/2/2007"))
df3 <- merge(df,df2,by.df="Date",by.df2="Date")

write.table(df3, file = "household_power_consumption_SelectedDates.txt", append = FALSE, quote=FALSE, sep=";", row.names = FALSE)

setwd("ExploratoryDataAnalysis")
df <- data.frame(read.table("household_power_consumption_SelectedDates.txt",header = TRUE, sep =";", dec = ".", numerals = "no.loss"))
df$DateTime <- strptime(paste(df$Date,df$Time,sep=","), format="%d/%m/%Y,%H:%M:%S")

