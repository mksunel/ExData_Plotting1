plot2 <- function() {
  
  ##This function build graph of datetime vs Global_active_power in png format with file name "plot2.png" in active working directory
  
  #download zip file in active working directory if not exists  
  if (file.exists("exdata-data-household_power_consumption.zip") == FALSE) 
    download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "exdata-data-household_power_consumption.zip")
  
  #unzip data file in active working directory
  unzip(zipfile = "exdata-data-household_power_consumption.zip")
  
  #read data only for 01-Feb-2007 and 02-Feb-2007
  data <- read.table(file = "household_power_consumption.txt",skip = 66637, nrows =2880, sep = ';')
  
  #Assign colnames to data set
  colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  
  
  #Open png graphic device for plot 2
  png(file = "plot2.png", width = 480, height = 480)
  
  #Graph: datetime vs Global_active_power 
  with(data, plot(strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"), Global_active_power, type = "o", pch = "", ylab = "Global Active Power (kilowatts)", xlab = ""))
  
  #shutdown the last open device
  dev.off()
  
  
}