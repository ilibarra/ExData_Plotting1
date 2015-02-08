

plotAssignment1C <- function(){    
    library(data.table)
    print("loading data...")
    # STEP 1: load data
    dt <- fread("household_power_consumption.txt")
    # filter by dates
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") >= as.Date("2007-02-01"))
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))  
    # parse important numeric column
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    
    timeSeries <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
    png("plot3.png", width=480, height=480)    
    plot(timeSeries, dt$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(timeSeries, dt$Sub_metering_1)
    lines(timeSeries, dt$Sub_metering_2, col="red")
    lines(timeSeries, dt$Sub_metering_3, col="blue")
    legend("topright", pch='_', col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}