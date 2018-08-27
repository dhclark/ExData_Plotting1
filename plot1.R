## Reads data for required date range into R

df <- read.csv.sql("household_power_consumption.txt",
                   "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ",
                   sep=";")


## Adds column that combined date and time 

df$newdate <- with(df, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))


## Opens png and creates graph for plot 1

png( filename = "plot1.png", width = 480, height = 480)
hist(df$Global_active_power,xlab = "Global Active Power (kilowatts)", 
     col = "Red",
     main = "Global Active Power")
dev.off()
