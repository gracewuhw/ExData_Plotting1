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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subdata, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="")})
dev.off()