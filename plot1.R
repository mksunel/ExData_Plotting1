plot1 <- function() {
  
  ##This function build histogram of data column Global_active_power in png format with file name "plot1.png" in active working directory
  
  #download zip file in active working directory if not exists  
  if (file.exists("exdata-data-household_power_consumption.zip") == FALSE) 
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata-data-household_power_consumption.zip")
  
  #unzip data file in active working directory
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  
  #read data only for 01-Feb-2007 and 02-Feb-2007
  data <- read.table(file = "household_power_consumption.txt",skip = 66637, nrows =2880, sep = ';')
  
  #Assign colnames to data set
  colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  
  
  #Open png graphic device for plot 1
  png(file = "plot1.png", width = 480, height = 480)
  
  #Graph: build Histogram of data column Global_active_power 
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
  
  #shutdown the last open device
  dev.off()

}