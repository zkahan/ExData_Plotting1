## Coursera - Exploratory Data Analysis
## Course Project 1

## Zammi Kahan 
## This is the R file (plot2.R) to generate the PNG plot2.png
##

## Make sure that you have set the working directory to the location where data file was extracted.
## setwd("/Users/zammi/Documents/Coursera/Exploratory_Data_Analysis/Assignment1")
getwd()

## Read the data file, and load to the memory.
power_consumption_data <- read.table("household_power_consumption.txt", 
                                     header = TRUE, 
                                     sep = ";", 
                                     nrows = 2075259,
                                     na.strings = "?",)

## DateTime field added for better data distribution in date/time based graphs
power_consumption_data$DateTime <- with(power_consumption_data,
                                        strptime(
                                                paste(power_consumption_data$Date, 
                                                      power_consumption_data$Time, sep = "-"),
                                        format = "%d/%m/%Y-%H:%M:%S"
                                                )
                                        )
head(power_consumption_data)
## Filter data of 2007-02-01 and 2007-02-02 plotting 
power_consumption_sample <- power_consumption_data[power_consumption_data$Date == '1/2/2007' | power_consumption_data$Date == '2/2/2007',]
power_consumption_sample <- na.omit(power_consumption_sample)
rownames(power_consumption_sample) <- NULL

## Plot the graph to the screen
with(power_consumption_sample, {
        plot(
                power_consumption_sample$DateTime, power_consumption_sample$Global_active_power,
                xlab = "",
                ylab = "Global Active Power (kilowatts)",
                type = "n"
        )
        lines(power_consumption_sample$DateTime, power_consumption_sample$Global_active_power) 
}
)

## Copy the plot to PNG file: plot2.png and close the devices (Screen & PNG)
dev.copy(png, file = "plot2.png")
## dev.off(dev.prev())
dev.off()
