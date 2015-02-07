##Read the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', stringsAsFactors = FALSE, na.string = "?")

##Subset the two dates required from the original data
newdata <- subset(data, Date == '1/2/2007'| Date == '2/2/2007')

##Format the Date column
newdata$Date <- as.Date(newdata$Date, format = "%d/%m/%Y")

##Format the Time column
newdata$Time <- strftime(strptime(newdata$Time, format = "%H:%M:%S"), format = "%H:%M:%S")

##Save the plot in a png format
png("plot1.png", width = 480, height = 480)

plot1 <- hist(newdata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

plot1

dev.off()

