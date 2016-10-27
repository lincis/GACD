# Course project in "Getting and Clearing Data" @Coursera

The repository contains script run_analysis.R to perform data tidying on _Human Activity Recognition Using Smartphones Dataset_, the following actions are performed:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement.
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names.
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data prepared in steps 4. and 5. is exported to files TidyData.txt and TidyMeltedData.txt respectively.

The script assumes that dataset is downloaded from [this location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and the script is located at the root directory of the extracted archive.

For data format in TidyData.txt and TidyMeltedData.txt see CodeBook.md.
