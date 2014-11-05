## load data

data <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors=FALSE)

library(lubridate)
## 

data$Date <- dmy(data$Date)

dat <- data[data$Date >= "2007-02-01" & data$Date < "2007-02-03",]

dat$DateTime <- paste(dat$Date, dat$Time)
dat$DateTime <- strptime(dat$DateTime, "%Y-%m-%d %H:%M:%S")

with(dat, plot(DateTime, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))


dev.copy(png,'plot2.png')
dev.off()