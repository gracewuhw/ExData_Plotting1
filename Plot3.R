#import the file
mydata <- read.table(file = "D://Data Science Coursera//Exploratory Data Analysis with R//exdata_data_household_power_consumption//household_power_consumption.txt", sep = ";", head = TRUE)
#get the data we want
subdata <- subset(mydata, Date == "1/2/2007" | Date == "2/2/2007")
#reformat the "Date" 
ctdate <- as.Date(subdata$Date,format='%d/%m/%Y')
wkdate <- weekdays(ctdate)
datetime <- paste(ctdate, subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)
#turn "Global_active_power" to numerical 
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

#draw the plot
png("plot3.png", width=480, height=480)
plot(subdata$Datetime, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(subdata$Datetime, subdata$Sub_metering_2, type="l", col="red")
lines(subdata$Datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()