#Function to plot Active Power, Voltage, Submetering, Reactive Power vs time in the day
plot4 <- function() {
    #Read the entire data set and subset for the data on Feb-1 and Feb-2 2007
	PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
	Data <- PowerData[PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",]
	
    #plot into a PNG file - 480 x 480 pixels
	png(file = "plot4.png")
	
	par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 2, 0, 0))
	
	plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
		
	plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
		
	plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
	lines(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_1, type = "l", col = "black")
	lines(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_2, type = "l", col = "red")
	lines(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Sub_metering_3, type = "l", col = "blue")
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
		
	plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
	
	dev.off()
}

#Run the function
plot4()