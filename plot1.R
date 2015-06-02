#plot1.R

#Read in data.  Mark "?" as NA
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?")

#Convert Date to Date format
data$Date <- as.Date(data$Date,"%d/%m/%Y")

#Convert Time to Date/Time format
data$Time <- (strptime(data$Time,"%H:%M:%S"))

