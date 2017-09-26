

################## PLOT 1 #################


# Data Import
location <- "filepath/household_power_consumption.txt"
households <- read.table(location, header = TRUE, dec = ".", stringsAsFactors = FALSE, sep = ";")

# Changing variables into proper formats
households$Date <- as.Date(households$Date, format="%d/%m/%Y")
households$Global_active_power <- as.numeric(households$Global_active_power)

# Subsetting 
sub_households <- subset(households, subset = Date == "2007-02-01" | Date == "2007-02-02")

# Plotting
Sys.setlocale("LC_TIME", "English") # weekdays in English
hist(sub_households$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Saving into .png
dev.copy(png, file="filepath/plot1.png", height=480, width=480)
dev.off()











