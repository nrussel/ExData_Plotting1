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

#Plot 3
png(filename="plot3.png",width=480,height=480)
with(df,plot(datetime,Sub_metering_1,type="n",xlab="",
             ylab="Energy sub metering"))
with(df,lines(datetime,Sub_metering_1))
with(df,lines(datetime,Sub_metering_2,col="red"))
with(df,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()