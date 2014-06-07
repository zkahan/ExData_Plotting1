## Coursera - Exploratory Data Analysis
## Course Project 1

## Zammi Kahan 
## This is the R file (plot1.R) to generate the PNG plot1.png
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

## Filter data of 2007-02-01 and 2007-02-02 plotting									
power_consumption_data$Date <- as.Date(power_consumption_data$Date, "%d/%m/%Y")
power_consumption_sample <- power_consumption_data[power_consumption_data$Date == '2007-02-01' | power_consumption_data$Date == '2007-02-02',]
power_consumption_sample <- na.omit(power_consumption_sample)
rownames(power_consumption_sample) <- NULL

## Set up the layout to the plot the graphs
par(mfcol = c(1, 1))

## Plot the histrogram to the screen
with(power_consumption_sample, hist(
                                        power_consumption_sample$Global_active_power,
                                        col = "red",
                                        xlab = "Global Active Polwer (kilowatts)",
                                        ylab = "Frequency",
                                        main = "Global Active Power"
                                )
) 

## Copy the plot to PNG file: plot1.png and close the devices (Screen & PNG)
dev.copy(png, file = "plot1.png")
## dev.off(dev.prev())
dev.off()
