
# This method receives two vectors, x and y, and plots them into
# a line plot. If newplot=FALSE, new lines are added to
# the current plot
plotTimeSeries <- function(x, y, ylab="Y", xlab="X", col="black",
                           newplot=TRUE) {
    if(newplot)
        plot(x, y, type="n", ylab=ylab, xlab=xlab)
    lines(x, y, col=col)
}

plotAssignment1D <- function(){
    library(data.table)
    print("loading data...")
    # STEP 1: load data
    dt <- fread("household_power_consumption.txt")
    # filter by dates
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") >= as.Date("2007-02-01"))
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))  
    # parse important numeric column
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    png("plot4.png", width=480, height=480)    
    par(mfrow=c(2,2))
    timeSeries <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
    
    # STEP 2: PLOT
    # 1
    plotTimeSeries(timeSeries, dt$Global_active_power,
                   ylab="Global Active Power", xlab="")
    # 2
    plotTimeSeries(timeSeries, dt$Voltage,
                   ylab="Voltage", xlab="datetime")
    # 3
    plotTimeSeries(timeSeries, dt$Sub_metering_1,
                    ylab="Energy sub metering", xlab="")
    plotTimeSeries(timeSeries, dt$Sub_metering_2, col="red", newplot=FALSE)
    plotTimeSeries(timeSeries, dt$Sub_metering_3, col="blue", newplot=FALSE)
    legend("topright", pch='_', col=c("black", "red", "blue"), bty="n", 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))    
    # 4
    plotTimeSeries(timeSeries, dt$Global_reactive_power, 
                   ylab="Global_reactive_power", xlab="datetime")
    dev.off()
}