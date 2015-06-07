#Get data from text file 
entireData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA")
data <- entireData[entireData$Date %in% c("1/2/2007","2/2/2007") ,]

#Initialize png file
png("plot1.png", width=480, height=480)
par(mar = c(6,6,4,2))

#Plot the graph
hist(as.numeric(data$Global_active_power), main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")

dev.off()