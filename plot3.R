## Reads data for required date range into R

df <- read.csv.sql("household_power_consumption.txt",
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep=";")


## Adds column that combined date and time 

df$newdate <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


## Opens png and creates graph for plot 3


png( filename = "plot3.png", width = 480, height = 480)
plot(df$newdate,df$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df$newdate,df$Sub_metering_2, col = "red")
lines(df$newdate,df$Sub_metering_3, col = "Blue")
legend("topright", 
       lwd = 1, 
       seg.len = 2,
       col = c("black", "Red", "Blue"), 
       legend  = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
