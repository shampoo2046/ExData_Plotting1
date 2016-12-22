data <- read.table("household_power_consumption.txt", sep = ";",header = 1)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, Date=="2007-02-01"|Date=="2007-02-02")
data1[,3:8] <-sapply(data1[,3:8],as.character)
data1[,3:8] <-sapply(data1[,3:8],as.numeric)
data1$Time <-as.character(data1$Time)
x <- paste(data1$Date,data1$Time)
data1$datetime <- strptime(x,"%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png")
par(mfrow = c(2, 2))
with(data1, {
  plot(datetime, Global_active_power, type = "n",
       xlab = " ", 
       ylab = "Global Active Power (kilowatts)")
  lines(datetime, Global_active_power)
  
  plot(datetime, Voltage, xlab = " datetime ",type = "n", 
       ylab = "voltage")
  lines(datetime, Voltage)
  
  plot(datetime, Sub_metering_1, type = "n",
       xlab = " ", 
       ylab = "Energy sub metering")
  
  lines(datetime, Sub_metering_1)
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", pch=20, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(datetime, Global_reactive_power, xlab = " datetime ",type = "n", 
       ylab = "Global_reactive_power")
  lines(datetime, Global_reactive_power)
  
})
dev.off()