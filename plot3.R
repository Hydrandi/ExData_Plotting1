## load data

data <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors=FALSE)

library(lubridate)
## 

data$Date <- dmy(data$Date)

dat <- data[data$Date >= "2007-02-01" & data$Date < "2007-02-03",]

dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- strptime(dat$DateTime, "%Y-%m-%d %H:%M:%S")

png("plot3.png")
with(dat, plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering"))
with(dat, points(DateTime, Sub_metering_1, col ="black", type= "l"))
with(dat, points(DateTime, Sub_metering_2, type="l", col ="red"))
with(dat, points(DateTime, Sub_metering_3, type="l", col ="blue"))
legend("topright", cex=0.75, lty= 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
