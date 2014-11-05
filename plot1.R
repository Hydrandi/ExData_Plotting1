## load data

data <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";", stringsAsFactors=FALSE)

library(lubridate)
## 

data$DateTime <- paste(data$Date, data$Time)
strptime(data$DateTime, "%d/%m/%y %H:%M:%S")

data$Date <- dmy(data$Date)

dat <- data[data$Date >= "2007-02-01" & data$Date < "2007-02-03",]

hist(dat$Global_active_power, breaks=15, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.copy(png,'plot1.png')
dev.off()