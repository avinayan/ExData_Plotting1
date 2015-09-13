#Function to plot Sub Metering vs time in the day
plot3 <- function() {
    #Read the entire data set and subset for the data on Feb-1 and Feb-2 2007
	PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
	Data <- PowerData[PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",]
	
    #plot into a PNG file - 480 x 480 pixels
	png(file = "plot3.png")
    
	plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
	lines(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_1, type = "l", col = "black")
	lines(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_2, type = "l", col = "red")
	lines(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_3, type = "l", col = "blue")
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
    
	dev.off()
}

#Run the function
plot3()