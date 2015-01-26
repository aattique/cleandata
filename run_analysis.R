## R Project for Getting and Cleaning data course


## Reading the libraries required for the script
library(data.table)
library(plyr)

## Reading the files into R for processing
testdata <- read.table("X_test.txt")
traindata<- read.table("X_train.txt")
features <- read.table("features.txt")

## Reading the variable names
naam<- as.character(features$V2)

activity_test <- read.table("./test/y_test.txt")
names(activity_test)<-c("Activity")
testdata$activity <- activity_test$Activity

activity_train <- read.table("./train/y_train.txt")
names(activity_train)<-c("Activity")
traindata$activity <- activity_train$Activity

subject_train <- read.table("./train/subject_train.txt")
names(subject_train)<-c("subject")
traindata$subject <- subject_train$subject

subject_test <- read.table("./test/subject_test.txt")
names(subject_test)<-c("subject")
testdata$subject <- subject_test$subject

## Part 1 of the assignment: Merging the data  training and test data 
data <- rbind(traindata, testdata)

## Assigning the names to variables in the data
names(data) <- c(naam, "activity", "subject")

## Extracting only the data with mean and Standard deviations 
## (Please note: I exclueded Mean Frequency i.e.   meanFreq() as it is mean of 
##Frequencies and not required: refer to the "features_info.txt" file)

datacol <- grep("(mean|std)", naam, value = T)
cols <- !grepl("Freq", datacol)
datacols <- datacol[cols]

## Part 2: Extracting only the measurements on the mean and standard deviation
## and rearragment to get activity and subject at the front

tidydata<- data[(1:nrow(data)),c("activity", "subject", datacols)]

## Part 3: Use descriptive activity names to name the activities in the data set

## Removal of "()" from the variable names

bracket <-gsub("()", "", names(tidydata), fixed = TRUE)


## Assigning the names to the data
tdata <-tidydata
names(tdata) <- bracket


## Part 5. Independent tidy data set with the average of each variable for each 
## activity and each subject

agg<-aggregate(tdata, by = list(tdata$activity, tdata$subject), mean)
tidy <- data.frame(agg[,4],as.integer(agg[,3]),agg[5:70])


## Part 4: Appropriately labels the data set with descriptive variable names. 
setnames(tidy, 1:2, c("subject", "activity"))
label <- read.table("activity_labels.txt")
names(label) <- c("activity", "Name")
tidy2 <- join(tidy, label)

## Setting up the data for write.table
tidyf <- data.frame(tidy2[,1], tidy2[,69], tidy2[,3:68])
setnames(tidyf, 1:2, c("subject", "activity"))

write.table(tidyf, "tidydata.txt", row.name = FALSE)