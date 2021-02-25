#setting up the libraries
library(lubridate)

#Setting the wd and reading the file
setwd("~/Github/ExData_Plotting1")

#Reading my own file (also in github)
power <- read.csv("~/Github/ExData_Plotting1/household_power_consumption.txt", sep=";")

#Setting date and time to the right format
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)
str(power)

#subsetting the file
power <- subset(power,
                power$Date == "2007-02-01" | 
                power$Date == "2007-02-02" )


#Setting the correct data tipes for the rest of the variables
names <- colnames(power[,c(3:9)])
power[,names] <- sapply(power[,names] , as.numeric)


#Creating png file
png("plot1.png",
    width = 480, height = 480) 

?png
# Create plot1
hist(power$Global_active_power, col = "red",
     main= 'Global Active Power', xlab= "Global Active Power (Kilowats)" )

# Close the device file
dev.off()

