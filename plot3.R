plot3 <- function() {
  
  # Read data
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

# Set locale to English to format weekdays correctly (works on Windows only)
# Uncomment the following statement if weekdays are generated in your local language
#  Sys.setlocale("LC_TIME", "English")

  # Create plot
  png('plot3.png')
  plot(sub$Datetime, sub$Sub_metering_1, type="line", ylab="Energy sub metering", xlab="")
  lines(sub$Datetime, sub$Sub_metering_2, col="red")
  lines(sub$Datetime, sub$Sub_metering_3, col="blue")
  dev.off()
}
