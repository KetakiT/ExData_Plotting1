#Get data from text file 
entireData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA", stringsAsFactors = FALSE, dec = ".")
data <- entireData[entireData$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Initialize png file
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
par(mar = c(6,6,4,2))

# Graph1
plot(datetime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Graph2
plot(datetime,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Graph3
with(data, plot(datetime,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(data, points(datetime,data$Sub_metering_2, col="Red", type="l"))
with(data, points(datetime,data$Sub_metering_3, col="Blue", type="l"))
legend("topright",col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n")

#Graph4
plot(datetime,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()