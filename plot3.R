plot3 <- function() {
    ## Load the data.
    data<- read.csv(file="household_power_consumption.txt", sep=";",na.strings="?")
        
    ## Create a vector for the date in POSIXlt format.
    date<-as.POSIXlt(data$Date, format="%d/%m/%Y")
        
    ## Create variables for the start and end date for subsetting the 
    ## data.
    start.date<-as.POSIXct("2007-02-01")
    end.date<-as.POSIXct("2007-02-02")
    data2<-subset(data,date>=start.date & date<=end.date)
    datetime<-as.POSIXlt(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S")
    
    ## Open a PNG device for outputting the plot.
    png("plot3.png", width=480, height=480)
    plot(x=datetime, y=data2$Sub_metering_1,type="n", 
         ylab="Energy sub metering", xlab="")
    lines(x=datetime,y=data2$Sub_metering_1)
    lines(x=datetime,y=data2$Sub_metering_2, col="red")
    lines(x=datetime,y=data2$Sub_metering_3, col="blue")
    legend("topright", lty=1, col=c("black","red","blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}