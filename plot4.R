
## Reads data for required date range into R

df <- read.csv.sql("household_power_consumption.txt",
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep=";")


## Adds column that combined date and time 

df$newdate <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


## Opens png and creates graphs for plot 4

png( filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(df, {
  plot(newdate, Global_active_power, ylab = "Global Active Power", type = "l", xlab = "")
  plot(newdate,Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
  plot(df$newdate,df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(df$newdate,df$Sub_metering_2, col = "red")
  lines(df$newdate,df$Sub_metering_3, col = "Blue")
  legend("topright", 
         lwd = 1, 
         seg.len = 2,
         bty = "n", 
         col = c("black", "Red", "Blue"), 
         legend  = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(newdate, Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
})
dev.off()
