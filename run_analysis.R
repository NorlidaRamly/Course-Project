##run_analysis.R

##Package
library (data.table)

##Test dataset
##• The test datasets is stored in the TEST folder
##• It consists of the subject_test.txt, X_test.txt and y_test.txt files
##• Read all 3 files
subjectTest <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/test/X_test.txt", header = FALSE)

##Training Dataset
##• The training datasets is stored in the TRAIN folder
##• It consists of the subject_train.txt, X_train.txt and y_train.txt files
##• Read all 3 files
subjectTrain <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/train/X_train.txt", header = FALSE)


##PART 1: Merges the training and the test sets to create one data set.
subject <- rbind(subjectTrain, subjectTest)
activity <- rbind(activityTrain, activityTest)
features <- rbind(featuresTrain, featuresTest)

##Label featuresTrain (X_test & X_train) columns according to the features.txt
featureNames <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/features.txt")
colnames(features) <- t(featureNames[2])

##Label activity(Y_test & Y_train) column as “Activity" and subject(subject_test & subject_train) as "Subject"
activityLabels <- read.table("D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activity) <- "Activity"
colnames(subject) <- "Subject"

##Combine all three (subject, activity and features) into one dataset
##dim(subject) = 10299     1; dim(activity) = 10299     1; dim(features) =  10299   561
completeData <- cbind(features,activity,subject)


##PART 2:  Extracts only the measurements on the mean and standard deviation for each measurement (features).
names(completeData) <- gsub("mean", "Mean", names(completeData)) # capitalize M
names(completeData) <- gsub("std", "Std", names(completeData)) # capitalize S
MeanSTD <- grep("Mean|Std", names(completeData), ignore.case=TRUE) ##86 columns

#Adding activity and subject columns (Column 562, 563)
TotalColumnNeeded <- c(MeanSTD, 562, 563)  #88 columns
CleanedData <- completeData[, TotalColumnNeeded] ##10299 rows and 88 columns


##PART 3: Uses descriptive activity names to name the activities in the data set.
CleanedData$Activity <- CleanedData$Activity <- as.character(CleanedData$Activity)
for (i in 1:6){
        CleanedData$Activity[CleanedData$Activity == i] <- as.character(activityLabels[i,2])
}
View(CleanedData)     ## 10,299 observations 88 variables


##PART 4:  Appropriately labels the data set with descriptive variable names.
names(CleanedData)
names(CleanedData)<-gsub("Acc", "Accelerometer", names(CleanedData))
names(CleanedData)<-gsub("Gyro", "Gyroscope", names(CleanedData))
names(CleanedData)<-gsub("^t", "Time", names(CleanedData))
names(CleanedData)<-gsub("^f", "Frequency", names(CleanedData))
names(CleanedData)


#Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#Set the subject variable in the data as a factor

CleanedData$Subject <- as.factor(CleanedData$Subject)
CleanedData <- data.table(CleanedData)

#Create tidyData as a set with average for each activity and subject
TidyData <- aggregate(. ~Subject + Activity, CleanedData, mean)

#Order tidayData according to subject and activity
TidyData <- TidyData[order(TidyData$Subject,TidyData$Activity),]

#Write tidyData into a text file (180 records and 88 variables)
write.table(TidyData, file = "D:/Data_Norlida/Data Science/Module3/Data/UCI HAR Dataset/Tidy.txt", row.names = FALSE)
