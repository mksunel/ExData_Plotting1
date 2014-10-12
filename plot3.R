plot3 <- function() {
  
  ##This function build graph of "datetime vs Energy sub metering" in png format with file name "plot3.png" in active working directory
  
  #download zip file in active working directory if not exists  
  if (file.exists("exdata-data-household_power_consumption.zip") == FALSE) 
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata-data-household_power_consumption.zip")
  
  #unzip data file in active working directory
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  
  #read data only for 01-Feb-2007 and 02-Feb-2007
  data <- read.table(file = "household_power_consumption.txt",skip = 66637, nrows =2880, sep = ';')
  
  #Assign colnames to data set
  colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  
  #Open png graphic device for plot 3
  png(file = "plot3.png", width = 480, height = 480)
  
  #setup empty frame with labels on x and y axis
  plot(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
  
  #plot data on frame for datetime vs Sub_metering_1
  points(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "o", col = "black", pch = "")
  
  #plot data on frame for datetime vs Sub_metering_2
  points(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, type = "o", col = "red", pch = "")
  
  #plot data on frame for datetime vs Sub_metering_3
  points(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, type = "o", col = "blue", pch = "")
  
  #Set legends
  legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
  
  #shutdown the last open device
  dev.off()
  
  
}