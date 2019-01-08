# get_and_clean_data_week4_project

# Hi, this script is for tidy_data.txt
# For more information, plz see the codeBook.

## Set directory
path <- setwd("/users/yun/datasciencecoursera/R_notes/UCI HAR Dataset")

## Read data from flat files
# key: file.path()
trainingSubjects <- read.table(file.path(path, "train", "subject_train.txt"))
trainingValues <- read.table(file.path(path, "train", "X_train.txt"))
trainingActivity <- read.table(file.path(path, "train", "y_train.txt"))

testSubjects <- read.table(file.path(path, "test", "subject_test.txt"))
testValues <- read.table(file.path(path, "test", "X_test.txt"))
testActivity <- read.table(file.path(path, "test", "y_test.txt"))

features <- read.table(file.path(path, "features.txt"), as.is = T)
activities <- read.table(file.path(path, "activity_labels.txt"))
colnames(activities) <- c("activityId", "activityLabel")

## Merges the training and the test sets to create one data set.
# key: cbind and rbind
train <- cbind(trainingSubjects, trainingValues, trainingActivity)
test <- cbind(testSubjects, testValues, testActivity)
combine <- rbind(train, test)

## Extracts subjectID, activityID, and only the measurements on the mean and standard deviation for each measurement.
# key: grep
names(combine) <- c("subjectID", features[,2], "activityID")
col <- grep("subjectID|activityID|mean|std", names(combine))
combine <- combine[, col]

## Uses descriptive activity names to name the activities in the data set
# key: factor()
combine$activityID <- factor(combine$activityID, 
                             levels = activities[, 1], 
                             labels = activities[, 2])

## Appropriately labels the data set with descriptive variable names.
# key: gsub() which's for the whole content
# compare with sub()
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
# key: dplyr and %>%
library(dplyr)
combine_1 <-combine %>%
  group_by(subjectID, activityID) %>%
  summarise_each(funs, mean)

write.table(combine_1, "tidy_data.txt", row.names = FALSE, quote = FALSE) # quoto = False means the col.names without quoto









