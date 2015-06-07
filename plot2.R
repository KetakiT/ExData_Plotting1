#Get data from text file 
entireData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "NA", stringsAsFactors = FALSE, dec = ".")
data <- entireData[entireData$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Plot the graph
par(mar = c(6,6,4,2))
plot(datetime,data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Copy graph to png file
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()