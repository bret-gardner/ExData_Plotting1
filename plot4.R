#plot4.R
install.packages("data.table")
library(data.table)
#Read in data for slected date range
data <- fread("household_power_consumption.txt",sep = ";", na.strings = "?", header = FALSE, skip = "1/2/2007", nrows = 2880)

#Add header to data
header <- read.table("household_power_consumption.txt",nrows = 1,sep =";",header=TRUE)
setnames(data,names(header))

#Convert Date to date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$weekday <- strftime(data$Date,"%a")
data$Clock <- paste(data$Date,data$Time)
data$Clock <- as.POSIXct(data$Clock,format = "%Y-%m-%d %H:%M:%S")
#Plot line graph of time vs. global active power to png
png(filename="plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), bg = "transparent")
with(data,{
  #Plot 1
  plot(data$Clock,data$Global_active_power,type="l", ylab = "Global Active Power", xlab = "")
  #Plot 2
  plot(data$Clock,data$Voltage,type ="l",ylab = "Voltage",xlab="datetime")
  #Plot 3
  with(data,plot(Clock,Sub_metering_1, xlab= "",ylab = "Energy sub metering",type = "n"))
  with(data, lines(Clock,Sub_metering_1,col="black"))
  with(data, lines(Clock,Sub_metering_2,col="red"))
  with(data, lines(Clock,Sub_metering_3,col="blue"))
  legend("topright",bty = "n", lty = 1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  #Plot 4
  plot(data$Clock,data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.off()

#%a = abbr weekday names