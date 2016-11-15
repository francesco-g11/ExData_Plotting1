## PLOT 4


## Step 0 : change local setting to show weekday in English, current settings are stored
lcs <- Sys.setlocale("LC_TIME")
Sys.setlocale("LC_TIME","C")


## Step 1 : read data  
## assumes the file are unzipped in a subdirectory of the working dir

tmpdf <- read.table(
                    paste0(getwd(),"/household_power_consumption/household_power_consumption.txt"),
                    header = TRUE, sep=";", na.strings = "?"
                    )
df <- filter(tmpdf,Date=="1/2/2007" | Date=="2/2/2007") #filter for the two dates

rm(tmpdf) #remove huge unuseful dataset

df$DateTime <- as.POSIXct(strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S"))

## Step 2 : creates plot on working dir, png format 480x480 px
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow=c(2,2))

#subplot 1
plot(df$DateTime,df$Global_active_power,type="l",xlab = "",ylab="Global Active Power")

#subplot 2
plot(df$DateTime,df$Voltage,type="l",xlab = "datetime",ylab="Voltage")

#subplot 3
plot(df$DateTime,df$Sub_metering_1,type="l",col="black",xlab = "",ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2,type="l", col="red")
lines(df$DateTime,df$Sub_metering_3,type="l", col="blue")
legend("topright",names(df[7:9]),bty="n",lty=1,col = c("black","red","blue"))

#subplot4
plot(df$DateTime,df$Global_reactive_power,type="l",xlab = "datetime", ylab="Global_reactive_power")

dev.off()



Sys.setlocale("LC_TIME",lcs) #reset local setting


rm(df) #clear



message("plot4.png done!")




