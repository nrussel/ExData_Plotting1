#Script assumes file has been downloaded, unzipped, and saved
#in the working directory
df <- read.table("household_power_consumption.txt",header=T,sep=";",na.strings = "?")

library(lubridate)
library(dplyr)

df <- df %>%
      mutate(datetime=dmy_hms(paste(Date,Time))) %>%
      mutate(Date=dmy(Date)) %>%
      mutate(Time=hms(Time)) %>%
      filter(Date=="2007-02-01" | Date=="2007-02-02")

#Plot 1
png(filename="plot1.png",width=480,height=480)
hist(df$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()