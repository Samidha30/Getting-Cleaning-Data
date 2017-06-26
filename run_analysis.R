## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Install & load the required packages
if(!require("data.table"))
  install.packages("data.table")

if(!require("reshape2"))
  install.packages("reshape2")

library(data.table)
library(reshape2)

#Download & unzip the raw dataset
if(!(file.exists("./Dataset.zip")))
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "./Dataset.zip");
  unzip("./Dataset.zip")
}

if(!file.exists("UCI HAR Dataset")) { 
  unzip("./Dataset.zip") }

#Load the Activity Labels & Features
activity_labels<-read.table("UCI HAR Dataset//activity_labels.txt")
features<-read.table("UCI HAR Dataset//features.txt")[,2]

#Load feature vector, Activity labels & Subject ID for training dataset
train_data<-read.table("./UCI HAR Dataset/train/X_train.txt")
train_activity<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_subjects<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#Load feature vector, Activity labels & Subject ID for testing dataset
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt")
test_activity<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_subjects<-read.table("./UCI HAR Dataset/test/subject_test.txt")

# Match Activity label to Activity description for training & testing dataset
train_activity[,2]<-activity_labels[train_activity[,1],2]
test_activity[,2]<-activity_labels[test_activity[,1],2]

#Merge Subject ID, Activity label & description with training & testing datasets correspondingly
train_data<-cbind(train_subjects,train_activity,train_data)
test_data<-cbind(test_subjects,test_activity,test_data)
 
# Merge Training & Testing data & rename the columns
merged_data<-rbind(train_data,test_data)
colnames(merged_data)<-c("Subject","Activity_number","Activity_description",as.character(features))

# Extract only data on Mean & standart deviation
extract_features<-grep("mean|std|Subject|Activity",colnames(merged_data))
merged_data<-merged_data[ ,extract_features]

# Reshape merged_data to form tidy_data
melt_data = melt(merged_data, id = c("Subject","Activity_number","Activity_description"))
tidy_data = dcast(melt_data, Subject + Activity_description ~ variable , mean)

write.table(tidy_data,"tidy_data.txt")

