data <- read.table("household_power_consumption.txt", sep=";", header=T)
dates <- grep("^1/2/2007$|^2/2/2007$", data$Date)

tbl <- data[dates, ]
datetime <- strptime(paste(tbl$Date, tbl$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

tbl$Global_active_power <- as.numeric(as.character(tbl$Global_active_power))

newtbl <- cbind(tbl, datetime)

plot(newtbl$datetime, newtbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480, units="px")
dev.off()