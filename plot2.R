################## PLOT 2 #################

## Data Import
location <- "filepath/household_power_consumption.txt"
mydata <- read.table(location, header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")

## Subsetting
sub_mydata <- mydata[mydata$Date %in% c("1/2/2007", "2/2/2007"),]

## Changing variables into proper format (date, numeric)
two_days <- strptime(paste(sub_mydata$Date, sub_mydata$Time), "%d/%m/%Y %H:%M:%S")
Global_active_power <- as.numeric(sub_mydata$Global_active_power)

# Plotting and Saving into .png
Sys.setlocale("LC_TIME", "English") # weekdays in English
png("filepath/plot2.png", width=480, height=480)
plot(two_days, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

