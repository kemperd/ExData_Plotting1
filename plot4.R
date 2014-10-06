plot4 <- function() {
  
  # Read file
  hhp <- read.csv('household_power_consumption.txt', sep=';')
  
  # Correct date columns
  hhp$Date <- as.Date(hhp$Date, "%d/%m/%Y")  
  hhp$Datetime <- paste(hhp$Date, hhp$Time)
  hhp$Datetime <- strptime(hhp$Datetime, "%Y-%m-%d %H:%M:%S")
  
  # Create subset and correct data types
  sub <- subset(hhp, Date == '2007-02-01' | Date == '2007-02-02')
  sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
  sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))  
  sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))  
  sub$Voltage <- as.numeric(as.character(sub$Voltage))  
  sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))  
  
# Set locale to English to format weekdays correctly (works on Windows only)
# Uncomment the following statement if weekdays are generated in your local language
#  Sys.setlocale("LC_TIME", "English")

  # Create plot
  png('plot4.png')
  par(mfrow=c(2,2))

  # Global active power (plot2)
  plot(sub$Datetime, sub$Global_active_power, type="line", ylab="Global Active Power (kilowatts)", xlab="")

  # Voltage
  plot(sub$Datetime, sub$Voltage, type="line", ylab="Voltage", xlab="")

  # Energy sub metering (plot3)
  plot(sub$Datetime, sub$Sub_metering_1, type="line", ylab="Energy sub metering", xlab="")
  lines(sub$Datetime, sub$Sub_metering_2, col="red")
  lines(sub$Datetime, sub$Sub_metering_3, col="blue")

  # Global reactive power
  plot(sub$Datetime, sub$Global_reactive_power, type="line", ylab="Global_reactive_power", xlab="")

  dev.off()
}