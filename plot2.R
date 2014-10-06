plot2 <- function() {
  
  # Read data
  hhp <- read.csv('household_power_consumption.txt', sep=';')
  
  # Correct date columns
  hhp$Date <- as.Date(hhp$Date, "%d/%m/%Y")  
  hhp$Datetime <- paste(hhp$Date, hhp$Time)
  hhp$Datetime <- strptime(hhp$Datetime, "%Y-%m-%d %H:%M:%S")

  # Create subset and correct data types
  sub <- subset(hhp, Date == '2007-02-01' | Date == '2007-02-02')
  sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
  
# Set locale to English to format weekdays correctly (works on Windows only)
# Uncomment the following statement if weekdays are generated in your local language
#  Sys.setlocale("LC_TIME", "English")

  # Create plot
  png('plot2.png')
  plot(sub$Datetime, sub$Global_active_power, type="line", ylab="Global Active Power (kilowatts)", xlab="")
  dev.off()
}
