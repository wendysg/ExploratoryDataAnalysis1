#read and subset the file
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header = TRUE, sep =";", na.strings = "?")
subData <- subset(fulldata, Date=="1/2/2007"| Date=="2/2/2007")

#string the data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

#do the plotting
png(file="plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", xlab=" ", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()