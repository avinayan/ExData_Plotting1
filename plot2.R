#Function to plot Active Power vs time in the day
plot2 <- function() {
    #Read the entire data set and subset for the data on Feb-1 and Feb-2 2007
	PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
	Data <- PowerData[PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",]
	
    #plot into a PNG file - 480 x 480 pixels
	png(file = "plot2.png")
    
	plot(strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S"), Data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
	dev.off()
}

plot2()