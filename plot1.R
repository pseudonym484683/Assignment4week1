# Read household_power_consumption.txt
library(date)

table_elec <- read.table("household_power_consumption.txt",sep=";", header=TRUE, na.string = "?")

table_elec$Date <- as.Date(table_elec$Date, "%d/%m/%Y")

table_filter <- subset(table_elec,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

hist(table_filter$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=600, height=600)
dev.off()