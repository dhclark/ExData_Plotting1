## Reads data for required date range into R
df <- read.csv.sql("household_power_consumption.txt",
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep=";")


## Adds column that combined date and time 

df$newdate <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


## Opens png and creates graphs for plot 2

png( filename = "plot2.png", width = 480, height = 480)
plot(df$newdate,df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)")
dev.off()
