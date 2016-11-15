## PLOT 3


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
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(df$DateTime,df$Sub_metering_1,type="l",col="black",xlab = "",ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2,type="l", col="red")
lines(df$DateTime,df$Sub_metering_3,type="l", col="blue")
legend("topright",names(df[7:9]),border="black",lty=1,col = c("black","red","blue"))
dev.off()



Sys.setlocale("LC_TIME",lcs) #reset local setting


rm(df) #clear



message("plot3.png done!")




