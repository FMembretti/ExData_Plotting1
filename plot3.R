
#################### PLOT 3 ##################

## Data Import
location <- "filepath/household_power_consumption.txt"
mydata <- read.table(location, header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")

## Subsetting
sub_mydata <- mydata[mydata$Date %in% c("1/2/2007", "2/2/2007"),]

# Extracting my variables and changing into proper formats
datetime <- strptime(paste(sub_mydata$Date, sub_mydata$Time), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(sub_mydata$Sub_metering_1)
Sub_metering_2 <- as.numeric(sub_mydata$Sub_metering_2)
Sub_metering_3 <- as.numeric(sub_mydata$Sub_metering_3)

# Plotting and saving as .png
Sys.setlocale("LC_TIME", "English") # weekdays in English
png("filepath/plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, Sub_metering_2, type = "l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()

