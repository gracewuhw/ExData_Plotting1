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

#draw plot
png("plot1.png", width = 480, height = 480)#or dev.copy(png, file="plot1.png")
with(subdata, hist(Global_active_power, col = "red", main = "Global Active Power"))
dev.off()