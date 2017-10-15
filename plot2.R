# Read household_power_consumption.txt
library(datetime)
library(date)


table_elec <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.string = "?")

table_elec$Date <- as.Date(table_elec$Date, "%d/%m/%Y")

table_filter <- subset(table_elec,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

coldatetime <- paste(table_filter$Date, table_filter$Time)
table_filter <- cbind(coldatetime,table_filter)
table_filter$coldatetime <- as.POSIXct(coldatetime)


plot(table_filter$Global_active_power~table_filter$coldatetime, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")

dev.copy(png,"plot2.png", width=600, height=600)
dev.off()