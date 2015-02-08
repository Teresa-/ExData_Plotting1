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

## Open Device
png(file = 'plot4.png', width=480, height=480)


## Save par contents before modifying for 2 X 2 matrix of graphs
oldpar <- par()
par(mfrow=c(2,2), mar=c(6,4,2,2))


## Create plot [1,1] - Global Active Power
project1$Date <- as.POSIXlt(paste(as.Date(project1$Date,format="%d/%m/%Y"),project1$Time))

plot(project1$Date,project1$Global_active_power,
     type="l", ylab="Global Active Power", xlab="")


## Create plot [1,2] - Voltage vs Date/Time
plot(project1$Date,project1$Voltage,
     type="l", xlab="datetime", ylab="Voltage")

## Create plot [2,1] - Energy Sub-metering
with(project1, 
     plot(project1$Date, project1$Sub_metering_1, 
          type="l", xlab="",ylab="Energy sub metering"))
with(project1, 
     points(project1$Date, project1$Sub_metering_2, 
            type="l", col="red"))
with(project1, 
     points(project1$Date, project1$Sub_metering_3, 
            type="l", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), cex=0.9, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")


## Create plot [2,2] - Global Reactive Power
plot(project1$Date,project1$Global_reactive_power,
     type="l", xlab="datetime", ylab="Global_reactive_power")

## Restore par to initial values
par(oldpar)

## Close device
dev.off()
