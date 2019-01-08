# get_and_clean_data_week4_project

path <- setwd("/users/yun/datasciencecoursera/R_notes/UCI HAR Dataset")

## Read data from flat files
trainingSubjects <- read.table(file.path(path, "train", "subject_train.txt"))
trainingValues <- read.table(file.path(path, "train", "X_train.txt"))
trainingActivity <- read.table(file.path(path, "train", "y_train.txt"))

testSubjects <- read.table(file.path(path, "test", "subject_test.txt"))
testValues <- read.table(file.path(path, "test", "X_test.txt"))
testActivity <- read.table(file.path(path, "test", "y_test.txt"))

features <- read.table(file.path(path, "features.txt"), as.is = TRUE)
activities <- read.table(file.path(path, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

## Merges the training and the test sets to create one data set.
train <- cbind(trainingSubjects, trainingValues, trainingActivity)
test <- cbind(testSubjects, testValues, testActivity)
combine <- rbind(train, test)

## Merges the training and the test sets to create one data set.
names(combine) <- c("subjectID", features[,2], "activityID")
col <- grep("subjectID|activityID|mean|std", names(combine))
combine <- combine[, col]

## Uses descriptive activity names to name the activities in the data set
combine$activityID <- factor(combine$activityID, 
                             levels = activities[, 1], 
                             labels = activities[, 2])

## Appropriately labels the data set with descriptive variable names.
names(combine)
names(combine) <- gsub("^f", "frequencyDomain", names(combine))
names(combine)<- gsub("^t", "timeDomain", names(combine))
names(combine) <- gsub("Acc", "Accelerometer", names(combine))
names(combine) <- gsub("Gyro", "Gyroscope", names(combine))
names(combine) <- gsub("Mag", "Magnitude", names(combine))
names(combine) <- gsub("Freq", "Frequency", names(combine))
names(combine) <- gsub("mean", "Mean", names(combine))
names(combine) <- gsub("std", "StandardDeviation", names(combine))
names(combine) <- gsub("[-()]", "", names(combine))
names(combine)

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
combine_1 <-combine %>%
  group_by(subjectID, activityID) %>%
  summarise_each(funs, mean)

write.table(combine_1, "tidy_data.txt", row.names = FALSE, quote = FALSE)









