## Read & subset data
powerdata <- read.table("~/Downloads/household_power_consumption.txt", 
                       sep=";", 
                        header= TRUE, 
                        na.strings="?")

Day1 <- powerdata[powerdata$Date=='1/2/2007',]
Day2 <- powerdata[powerdata$Date=='2/2/2007',]
project1 <- rbind(Day1, Day2)

## Convert Date/Time format
project1$Date <- as.POSIXlt(paste(as.Date(project1$Date,format="%d/%m/%Y"),project1$Time))

## Open device
png(file = 'plot3.png', width=480, height=480)

## Create Plot
 with(project1, 
      plot(project1$Date, project1$Sub_metering_1, 
           type="l", xlab="",ylab="Energy sub metering", cex.axis = 0.9,cex.lab=0.9))
 with(project1, 
      points(project1$Date, project1$Sub_metering_2, 
             type="l", col="red"))
 with(project1, 
      points(project1$Date, project1$Sub_metering_3, 
             type="l", col="blue"))
 legend("topright", lty=1, col=c("black","red","blue"), 
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close device
dev.off()