#plot1.R
install.packages("data.table")
library(data.table)

#Read in data for slected date range
data <- fread("household_power_consumption.txt",sep = ";", na.strings = "?", header = FALSE, skip = "1/2/2007", nrows = 2880)

#Add header to data
header <- read.table("household_power_consumption.txt",nrows = 1,sep =";",header=TRUE)
setnames(data,names(header))

#Convert Date to date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Plot histogram of global active power to png
png(filename="plot1.png", width = 480, height = 480)
par(bg = "transparent")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()


#dat$newdate <- with(dat, as.POSIXct(paste(date, time), format="%m-%d-%Y %H:%M"))
