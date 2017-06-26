#Getting & Cleaning 	Data Course Project

##Introduction
This is the course project for getting & cleaning data course on coursera. The project involves creating a R script called run_analysis.R to produce a tidy dataset out of the input datasets. 
The input data set represents data collected from the accelerometers & gyrometers from the Samsung Galaxy S smartphone. The script performs the following functions:

1. Extracts only measurements on mean and standard deviation from the exahustive features vectors for training & testing data
2. Uses descriptive activity names to name the activities for both the data sets
3. Merges Subject & Activity details with the data sets
4. Merges the modified training & testing datsets to form a cumulative dataset
5. Creates a second, independent tidy data set out of the cumulative dat set with the average of each variable for each activity and each subject.

##How to use run.analysis
* Set the working directory to where you would like to download all the required data sets (use setwd())
* Save run_analysis.R in the working directory
* The script automatically installs all the required packages (i.e. reshape & data.table) & downloads the required data sets
* Execute the source("run_analysis.R") command in R interface to produce the tidy data set.
