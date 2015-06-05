#plot2.R
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
png(filename="plot2.png", width = 480, height = 480)
plot(data$Clock,data$Global_active_power,type="l", ylab = "Global Active Power (Kilowatts)", xlab = "")
dev.off()


#%a = abbr weekday names