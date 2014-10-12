plot4 <- function() {
  
  ##This function build four graphs in one frame in png format with file name "plot4.png" in active working directory
  
  #download zip file in active working directory if not exists  
  if (file.exists("exdata-data-household_power_consumption.zip") == FALSE) 
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata-data-household_power_consumption.zip")
  
  #unzip data file in active working directory
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  
  #read data only for 01-Feb-2007 and 02-Feb-2007
  data <- read.table(file = "household_power_consumption.txt",skip = 66637, nrows =2880, sep = ';')
  
  #Assign colnames to data set
  colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  
  #Open png graphic device for plot 4
  png(file = "plot4.png", width = 480, height = 480)
  
  #Override margin frame to have 4 graphs in one frame
  par(mfcol = c(2,2))
  
  #Graph 1: Datetime vs Global_active_power
  with(data, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "o", pch = "", ylab = "Global Active Power", xlab = ""))
  
  
  #Graph 2: Datetime vs Energy sub metering
  plot(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
  
  points(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "o", col = "black", pch = "")
  points(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, type = "o", col = "red", pch = "")
  points(strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, type = "o", col = "blue", pch = "")
  
  legend("topright",  col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty= "n")
  
  
  #Graph 3: Datetime vs Voltage
  with(data, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Voltage, type = "o", pch = "", ylab = "Voltage", xlab = "datetime"))
  
  
  #Graph 2: Datetime vs Global_reactive_power
  with(data, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "o", pch = "", ylab = "Global_reactive_power", xlab = "datetime"))
  
  
  #shutdown the last open device
  dev.off()
  
  
}