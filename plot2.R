##Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.string = "?")

##Subset the two dates required from the original data
newdata <- subset(data, Date == '1/2/2007'| Date == '2/2/2007')

##Create a new DateTime column
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Save the plot in a png format
png("plot2.png", width = 480, height = 480)

plot2 <- plot(newdata$DateTime, newdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

plot2

dev.off()
