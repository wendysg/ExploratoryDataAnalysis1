#read and subset the file
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header = TRUE, sep =";", na.strings = "?")
subData <- subset(fulldata, Date=="1/2/2007"| Date=="2/2/2007")

#string the data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)
voltage <- as.numeric(subData$Voltage)
globalReactivePower <- as.numeric(subData$Global_reactive_power)

#do the plotting
png(file="plot4.png", width=480, height=480)
par(mfcol=c(2,2))

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")

plot(datetime, voltage, type="l", xlab="daytime", ylab="Voltage")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
