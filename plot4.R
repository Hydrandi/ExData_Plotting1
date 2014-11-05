## load data

data <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors=FALSE)

library(lubridate)
## 

data$Date <- dmy(data$Date)

dat <- data[data$Date >= "2007-02-01" & data$Date < "2007-02-03",]

dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- strptime(dat$DateTime, "%Y-%m-%d %H:%M:%S")

png("plot4.png")
par(mfrow= c(2,2))
with(dat, {
        plot(DateTime, Global_active_power, type="l", xlab="", ylab = "Global Active Power")
        plot(DateTime, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
        plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering")
        points(DateTime, Sub_metering_1, col ="black", type= "l")
        points(DateTime, Sub_metering_2, type="l", col ="red")
        points(DateTime, Sub_metering_3, type="l", col ="blue")
        legend("topright", cex=0.75, lty= 1, bty= "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.off()
