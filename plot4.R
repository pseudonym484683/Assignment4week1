# Read household_power_consumption.txt
library(datetime)
library(date)


table_elec <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.string = "?")

table_elec$Date <- as.Date(table_elec$Date, "%d/%m/%Y")

table_filter <- subset(table_elec,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

coldatetime <- paste(table_filter$Date, table_filter$Time)
table_filter <- cbind(coldatetime,table_filter)
table_filter$coldatetime <- as.POSIXct(coldatetime)


labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2), mar=c(2,2,2,1), oma=c(0,0,2,0))
plot(table_filter$coldatetime, table_filter$Global_active_power, type="l", col="green", xlab="", ylab="Global Active Power")
plot(table_filter$coldatetime, table_filter$Voltage, type="l", col="orange", xlab="datetime", ylab="Voltage")
plot(table_filter$coldatetime, table_filter$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(table_filter$coldatetime, table_filter$Sub_metering_2, type="l", col="red")
lines(table_filter$coldatetime, table_filter$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(table_filter$coldatetime, table_filter$Global_reactive_power, type="l", col="blue", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png", width=600, height=600)
dev.off()