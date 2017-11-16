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

#Plot 2
png(filename="plot2.png",width=480,height=480)
with(df,plot(datetime,Global_active_power,type="n",xlab="",
             ylab="Global Active Power (kilowatts)"))
with(df,lines(datetime,Global_active_power))
dev.off()