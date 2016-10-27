# Clear workspace
rm(list = ls())

# Check if reshape2 package is available and install it if required
list.of.packages <- c("reshape2")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Load reshape2 package
library(reshape2)
#This is where data resides on my system
setwd("~/Dropbox/Coursera/Getting and Clearing data/project/UCI HAR Dataset/")

#Read all train and test data
trainY = read.table("./train/y_train.txt")
trainX = read.table("./train/X_train.txt")
testX = read.table("./test/X_test.txt")
testY = read.table("./test/y_test.txt")
trainSubject = read.table("./train/subject_train.txt")
testSubject = read.table("./test/subject_test.txt")
features = read.table("./features.txt")

#Merge X and Y data from test and train (step 1)
dataX = rbind(trainX, testX)
dataY = rbind(trainY, testY)
subject = rbind(trainSubject, testSubject)

#Add column name to the Subject dataset
names(subject) = c("Subject")

#Find mean and std feature index with regex
featureIndex = grep("mean\\(\\)|std\\(\\)", features[,2], value = FALSE)

#Extract data with mean and standard deviation to the data variable (step 2)
data = dataX[,featureIndex]

#Set column names for data mean and standard deviation data
names(data) = features[featureIndex, 2]

#Read activity names and change appropriate index to activity labels
activityNames = read.table("./activity_labels.txt")
dataY[,1]  = activityNames[dataY[, 1], 2]

#Set the name of activity names column to the "Activity" (step 3)  
names(dataY) = c("Activity")

#Create the tidy data set (step 4)
TidyData = cbind(subject, dataY, data)

#Create the data set with average of each variable or each activity and each subject (step 5)
meltedData = melt(TidyData, id = c("Subject", "Activity"))
TidyMeltedData = dcast(meltedData, Subject + Activity ~ variable, mean)

#Write datasets to the text files
write.table(TidyData, "./TidyData.txt", row.name=FALSE)
write.table(TidyMeltedData, "./TidyMeltedData.txt", row.name=FALSE)