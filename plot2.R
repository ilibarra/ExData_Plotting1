


## This script will solve assignment 1
plotAssignment1B <- function() {    
    library(data.table)
    print("loading data...")
    # STEP 1: load data
    dt <- fread("household_power_consumption.txt")
    # filter by dates
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") >= as.Date("2007-02-01"))
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))  
    # parse important numeric column
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    
    png("plot2.png", width=480, height=480)    
    plot(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S"), 
         dt$Global_active_power, type="n",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S"),
          dt$Global_active_power)
    # plot scatter to file
    dev.off()
}
    