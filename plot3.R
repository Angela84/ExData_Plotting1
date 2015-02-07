##Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.string = "?")

##Subset the two dates required from the data
newdata <- subset(data, Date == '1/2/2007'| Date == '2/2/2007')

##Create a new DateTime column
newdata$DateTime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Save the plot in a png format
png("plot3.png", width = 480, height = 480)

##Plot and add a legend to it
plot3 <- plot(newdata$DateTime, newdata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")

plot3 <- points(newdata$DateTime, newdata$Sub_metering_2, type = "l", col = "red")

plot3 <- points(newdata$DateTime, newdata$Sub_metering_3, type = "l", col = "blue")

plot3 <- legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), border = "black")

plot3

dev.off()
