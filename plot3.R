data <- read.table("household_power_consumption.txt", sep=";", header=T)
dates <- grep("^1/2/2007$|^2/2/2007$", data$Date)

tbl <- data[dates, ]
datetime <- strptime(paste(tbl$Date, tbl$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

newtbl <- cbind(tbl, datetime)

newtbl$Sub_metering_1 <- as.numeric(as.character(newtbl$Sub_metering_1))
newtbl$Sub_metering_2 <- as.numeric(as.character(newtbl$Sub_metering_2))
newtbl$Sub_metering_3 <- as.numeric(as.character(newtbl$Sub_metering_3))

plot(newtbl$datetime, newtbl$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(newtbl$datetime, newtbl$Sub_metering_2, type = "l", col="red")
lines(newtbl$datetime, newtbl$Sub_metering_3, type = "l", col="blue")
legend("topright", lwd=2, cex=1, y.intersp = .4, x.intersp = 1, lty=1, col=c("black","red","blue"), c("Sub metering 1","Sub metering 2","Sub metering 3"))
dev.copy(png, file="plot3.png", width=480, height=480, units="px")
dev.off()

