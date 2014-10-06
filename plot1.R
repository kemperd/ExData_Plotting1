plot1 <- function() {
  
  # Read data
  hhp <- read.csv('household_power_consumption.txt', sep=';')
  
  # Correct date columns
  hhp$Date <- as.Date(hhp$Date, "%d/%m/%Y")
  sub <- subset(hhp, Date == '2007-02-01' | Date == '2007-02-02')
  sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
  
  # Create plot
  png('plot1.png')
  hist(sub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
}
