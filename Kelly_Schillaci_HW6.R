complete.cases(airquality)
#Loading and Cleaning Data
my_airdata <- na.omit(airquality)

summary(my_airdata)

 

#Histograms
library(ggplot2)
OzoneHist <- ggplot(my_airdata, aes(x=Ozone)) + geom_histogram(binwidth=10,color="black", fill="white")+ggtitle("Ozone")
Solar.RHist <- ggplot(my_airdata, aes(x=Solar.R)) + geom_histogram(binwidth=25,color="black", fill="white")+ggtitle("Solar.R")
WindHist <- ggplot(my_airdata, aes(x=Wind)) + geom_histogram(color="black", fill="white")+ggtitle("Wind")
TempHist <- ggplot(my_airdata, aes(x=Temp)) + geom_histogram(binwidth=5,color="black", fill="white")+ggtitle("Temp")
#Boxplots
OzoneBoxplot <- ggplot(my_airdata, aes(x=Ozone,y=Temp)) + geom_boxplot(color="black", fill="white")+ggtitle("Ozone")
WindBoxplot <- ggplot(my_airdata, aes(x=Wind,y=Ozone)) + geom_boxplot(color="black", fill="white")+ggtitle("Wind")


AnotherOzoneBoxPlot <-ggplot(my_airdata, aes(factor(Month), Ozone)) +
  geom_boxplot()+
  xlab("Month")

#Changes over Time
library(scales)

my_airdata$Date <- as.Date( paste("1973", my_airdata$Month , my_airdata$Day , sep = "-" )  , format = "%Y-%m-%d" )

OzoneChange <- ggplot(my_airdata, aes(x=Date, y=Ozone, group=Month)) + geom_line(color="black")+ggtitle("Ozone")

Solar.RChange <- ggplot(my_airdata, aes(x=Date, y=Solar.R, group=Month)) + geom_line(color="black")+ggtitle("Solar.R")

WindChange <- ggplot(my_airdata, aes(x=Date, y=Wind, group=Month)) + geom_line(color="black")+ggtitle("Wind")

TempChange <- ggplot(my_airdata, aes(x=Date, y=Temp, group=Month)) + geom_line(color="black")+ggtitle("Temp")

#Reshape Data
library(reshape2)
Test <- my_airdata[,-(5:6)]

Reshape <- melt(Test, id="Date")

SummaryChange <- ggplot(Reshape, aes(x=Date, y=value, colour=variable, group=variable)) + geom_line()
                        
##Heatmap
Heatmap <- ggplot(data=Reshape, aes(x=Date, y=variable, group=variable)) + geom_tile(aes(fill=value))

Heatmap2 <- ggplot(data=Reshape, aes(x=Date, y=value, colour=variable, group=variable)) + geom_tile(aes(fill=variable))

Heatmap3 <- ggplot(data=Reshape, aes(x=variable, y=Date, colour=value)) + geom_tile(aes(fill=value))

#Scatterchart
Scaterchart <- ggplot(my_airdata, aes(x=Wind, y=Temp)) + geom_point(aes(size=Ozone, colour=Solar.R))

#Analysis

##In lower temperatures: Ozone levels are lower, Solar.R levels are lower and Wind speeds tend to be higher.
##In warmer temperatures:  Wind spees are lower, Solar.R and Ozone levels are higher. 
##The most useful visualizations were the line and scatterplots.
