plot1 <- function() {
    ## Load the data.
    data<- read.csv(file="household_power_consumption.txt", sep=";",na.strings="?")
    
    ## Create a vector for the date in POSIXlt format.
    date<-as.POSIXlt(data$Date, format="%d/%m/%Y")
        
    ## Create variables for the start and end date for subsetting the 
    ## data.
    start.date<-as.POSIXct("2007-02-01")
    end.date<-as.POSIXct("2007-02-02")
    data2<-subset(data,date>=start.date & date<=end.date)
    
    ## Open a PNG device for outputting the plot.
    png("plot1.png", width=480, height=480)
    hist(data2$Global_active_power, col=2, main="Global Active Power", 
         xlab="Global Active Power (kilowatts)",
         font.lab=2, font.axis=2)
    dev.off()
}