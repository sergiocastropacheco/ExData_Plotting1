#setting up the libraries
library(lubridate)
Sys.setlocale("LC_TIME", "en_US")

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
png("plot1.png",
    #width = 480, height = 480) 

?png
# Create plot2
plot(Global_active_power ~ datetime, data = power, col = "black",
     type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")

# Close the device file
dev.off()

