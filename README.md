# Getting & Cleaning 	Data Course Project

## Introduction
This is the course project for getting & cleaning data course on coursera. The project involves creating a R script called run_analysis.R to produce a tidy dataset out of the input datasets. 
The input data set represents data collected from the accelerometers & gyrometers from the Samsung Galaxy S smartphone. The script performs the following functions:

1. Installs & loads the required packages (i.e data.table & reshape2)
2. Download & unzip raw datasets
3. Load Activity labels & features
4. Loads feature vectors, activity & Subject details for both training & testing data
5. Uses descriptive activity names to name the activities for both the data sets
6. Merges Activity & Subject details with respective data sets
6. Merges training & testing data set to form merged dataset
7. Extracts only measurements on mean and standard deviation from the merged data set
8. Creates a second, independent tidy data set out of the merged dat set with the average of each variable for each activity and each    subject.

## How to use run.analysis
* Set the working directory to where you would like to download all the required data sets (use setwd())
* Save run_analysis.R in the working directory
* The script automatically installs all the required packages (i.e. reshape & data.table) & downloads the required data sets
* Execute the source("run_analysis.R") command in R interface to produce the tidy data set.
