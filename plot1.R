#read and subset the file
dataFile <- "./data/household_power_consumption.txt"
fulldata <- read.table(dataFile, header = TRUE, sep = ";", na.strings = "?")
subData <- subset(fulldata, Date == "1/2/2007"| Date =="2/2/2007")

#Do the plotting
GlobalActivePower <- as.numeric(subData$Global_active_power)
png(file = "plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", xlab="Global Active Power(kilowatts", main="Global Active Power")
dev.off()
