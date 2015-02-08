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
png(file = "plot1.png", width=480, height=480)

## Create plot using hist()
hist(project1$Global_active_power, 
     main=paste("Global Active Power"), 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="red")

## Close device
dev.off()

