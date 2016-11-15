## PLOT 1


## Step 1 : read data  
## assumes the file are unzipped in a subdirectory of the working dir
tmpdf <- read.table(
                    paste0(getwd(),"/household_power_consumption/household_power_consumption.txt"),
                    header = TRUE, sep=";", na.strings = "?"
                    )
df <- filter(tmpdf,Date=="1/2/2007" | Date=="2/2/2007") #filter for the two dates

rm(tmpdf) #remove huge unuseful dataset

## Step 2 : creates plot on working dir, png format 480x480 px
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()

rm(df) #clear

message("plot1.png done!")




