data <- read.table("household_power_consumption.txt", sep=";", header=T)
dates <- grep("^1/2/2007$|^2/2/2007$", data$Date)

tbl <- data[dates, ]

tbl$Global_active_power <- as.numeric(as.character(tbl$Global_active_power))

hist(tbl$Global_active_power, col="blue", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)" )
dev.copy(png, file="plot1.png", width=480, height=480, units="px")
dev.off()