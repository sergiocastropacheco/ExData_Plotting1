#setting up the libraries
library(lubridate)

#Setting up english as language for weekdays
Sys.setlocale("LC_TIME", "English")
weekdays(Sys.Date()+0:6)

#Setting the wd and reading the file
setwd("~/Github/ExData_Plotting1")

#Reading my own file (also in github)
power <- read.csv("~/Github/ExData_Plotting1/household_power_consumption.txt", sep=";")

#Creating a new date-time column
datetime <- paste(power$Date, power$Time)
datetime
datetime <- dmy_hms(datetime)
power$datetime <- datetime

#Setting date and time to the right format
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)
str(power)


#subsetting the file
power <- subset(power,
                power$Date == "2007-02-01" | 
                power$Date == "2007-02-02" )


#Setting the correct data types for the rest of the variables
names <- colnames(power[,c(3:9)])
power[,names] <- sapply(power[,names] , as.numeric)


#Creating png file
png("plot4.png",
    width = 480, height = 480) 
par(mfrow =c(2,2))


#Create plot 1
plot(Global_active_power ~ datetime, data = power, col = "black",
     type = "l", ylab = "Global Active Power", xlab = "")

#Create plot 2
plot(Voltage ~ datetime, data = power, col = "black",
     type = "l", ylab = "Voltage", xlab = "")


# Create plot3
plot(power$datetime, power$Sub_metering_1, type = "n", xlab = "" , ylab = "Energy Sub Metering")
with( power, lines(datetime, Sub_metering_1, col = "black"))
with( power, lines(datetime, Sub_metering_2, col = "red"))
with( power, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lty =1,
       col = c("black","red", "blue"),
      legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

#CREATE PLOT 4

plot(Global_reactive_power ~ datetime, data = power, col = "black",
     type = "l", ylab = "Global Reactive Power", xlab = "")

## Close the device file
dev.off()

