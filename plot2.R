data <- read.table("household_power_consumption.txt", sep = ";",header = 1)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data1 <- subset(data, Date=="2007-02-01"|Date=="2007-02-02")
data1[,3:8] <-sapply(data1[,3:8],as.character)
data1[,3:8] <-sapply(data1[,3:8],as.numeric)
data1$Time <-as.character(data1$Time)
x <- paste(data1$Date,data1$Time)
data1$datetime <- strptime(x,"%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png")
with(data1, plot(datetime, Global_active_power, type = "n",
     xlab = " ", 
     ylab = "Global Active Power (kilowatts)"))
with(data1, lines(datetime, Global_active_power))
dev.off()