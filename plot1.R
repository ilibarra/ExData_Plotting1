

## This script will solve assignment 1A
plotAssignment1A <- function() {
    library(data.table)
    print("loading data...")
    # STEP 1: load data
    dt <- fread("household_power_consumption.txt")
    # filter by dates
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") >= as.Date("2007-02-01"))
    dt <- subset(dt, as.Date(dt$Date, format="%d/%m/%Y") <= as.Date("2007-02-02"))  
    # parse important numeric column
    dt$Global_active_power <- as.numeric(dt$Global_active_power)
    
    
    # plot histogram to file
    png("plot1.png", width=480, height=480)    
    hist(as.numeric(dt$Global_active_power), 
         xlab="Global Active Power (kilowatts)", 
         main="Global Active Power", col="red")
    dev.off()
}
    