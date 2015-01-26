# Getting and Cleaning Data Project

## Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The script "run_analysis.R"" does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Data is available from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Detailed Process
Extract the zip file to you working directory. 
1. Merging the data  training and test data
2. Assigning the names to variables in the data
3. Extracting only the data with mean and Standard deviations (Please note: I exclueded Mean Frequency i.e.   meanFreq() as it is mean of Frequencies and not required: refer to the "features_info.txt" file which came with the data)
4. Extracting only the measurements on the mean and standard deviation and rearragment to get activity and subject at the front
5. Use descriptive activity names to name the activities in the data set (actually done after step 7 in script for ease)
6. Removal of "()" from the variable names
7. Independent tidy data set with the average of each variable for each activity and each subject
8. Write the clean dataset to disk.

## Cleaned Data

The resulting clean dataset is in saved in the working directory with the file name "tidydata.txt". It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.

