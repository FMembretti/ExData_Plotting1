
#################### PLOT 4 ##################

# Data Import
location <- "filepath/household_power_consumption.txt"
mydata <- read.table(location, header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")

# subsetting
subData <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

# changing into proper formats
two_days <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(subData$Global_active_power)
Global_reactive_power <- as.numeric(subData$Global_reactive_power)
Voltage <- as.numeric(subData$Voltage)
Sub_metering_1 <- as.numeric(subData$Sub_metering_1)
Sub_metering_2 <- as.numeric(subData$Sub_metering_2)
Sub_metering_3 <- as.numeric(subData$Sub_metering_3)


# Plotting and saving as .png
Sys.setlocale("LC_TIME", "English") # weekdays in English
png("filepath/plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))

plot(two_days, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(two_days, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(two_days, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(two_days, Sub_metering_2, type = "l", col="red")
lines(two_days, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n")

plot(two_days, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

