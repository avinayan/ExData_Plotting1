#Function to plot the histogram of Active Power
plot1 <- function() {
    #Read the entire data set and subset for the data on Feb-1 and Feb-2 2007
	PowerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
	Data <- PowerData[PowerData$Date == "1/2/2007" | PowerData$Date == "2/2/2007",]
	
    #plot into a PNG file - 480 x 480 pixels
	png(file = "plot1.png")
    
	hist(Data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
    
	dev.off()
}

#Run the function
plot1()