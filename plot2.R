#read and subset the file
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header = TRUE, sep =";", na.strings = "?")
subData <- subset(fulldata, Date=="1/2/2007"| Date=="2/2/2007")

#reformat data and time and do the plotting
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(subData$Global_active_power)

png(file="plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="1", xlab=" ", ylab="Global Active Power (kilowatts")
dev.off()
