# Read household_power_consumption.txt
library(datetime)
library(date)


table_elec <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.string = "?")

table_elec$Date <- as.Date(table_elec$Date, "%d/%m/%Y")

table_filter <- subset(table_elec,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

coldatetime <- paste(table_filter$Date, table_filter$Time)
table_filter <- cbind(coldatetime,table_filter)
table_filter$coldatetime <- as.POSIXct(coldatetime)


with(table_filter, {
  plot(Sub_metering_1~coldatetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~coldatetime,col='Red')
  lines(Sub_metering_3~coldatetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png,"plot3.png", width=600, height=600)
dev.off()