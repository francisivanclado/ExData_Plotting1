data <- read.table("household_power_consumption.txt", sep=";", header=T)
dates <- grep("^1/2/2007$|^2/2/2007$", data$Date)

tbl <- data[dates, ]
datetime <- strptime(paste(tbl$Date, tbl$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

newtbl <- cbind(tbl, datetime)

newtbl$Sub_metering_1 <- as.numeric(as.character(newtbl$Sub_metering_1))
newtbl$Sub_metering_2 <- as.numeric(as.character(newtbl$Sub_metering_2))
newtbl$Sub_metering_3 <- as.numeric(as.character(newtbl$Sub_metering_3))
newtbl$Global_active_power <- as.numeric(as.character(newtbl$Global_active_power))
newtbl$Voltage <- as.numeric(as.character(newtbl$Voltage))
newtbl$Global_reactive_power <- as.numeric(as.character(newtbl$Global_reactive_power))

par(mfrow = c(2,2))

plot(newtbl$datetime, newtbl$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(newtbl$datetime, newtbl$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(newtbl$datetime, newtbl$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(newtbl$datetime, newtbl$Sub_metering_2, type = "l", col="red")
lines(newtbl$datetime, newtbl$Sub_metering_3, type = "l", col="blue")
legend("topright", bty="n", lwd=2, cex=.5, y.intersp = .4, lty=1, col=c("black","red","blue"), c("Sub metering 1","Sub metering 2","Sub metering 3"))

plot(newtbl$datetime, newtbl$Global_reactive_power, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.copy(png, file="plot4.png", width=480, height=480, units="px")
dev.off()