This is a code book that describes the data and transformations work.

DATA

Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The datasets contains 6 activities: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The training datasets is stored in the TRAIN folder. It consists of the subject_train.txt, X_train.txt and y_train.txt files.  The test datasets is stored in the TEST folder. It consists of the subject_test.txt, X_test.txt and y_test.txt files.


TRANSFORMATIONS

Read all test files (3 files).
Read all training files (3 files).

PART 1: Merges the training and the test sets to create one data set by rbind.
Label featuresTrain (X_test & X_train) columns according to the features.txt.
Label activity(Y_test & Y_train) column as “Activity" and subject(subject_test & subject_train) as "Subject".
Combine all three (subject, activity and features) into one dataset.

PART 2:  Extracts only the measurements on the mean and standard deviation for each measurement (features).
Adding activity and subject columns (Column 562, 563).

PART 3: Uses descriptive activity names to name the activities in the data set (using activityLabels).

PART 4:  Appropriately labels the data set with descriptive variable names (example "Acc" with "Accelerometer").

Part 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Create tidyData as a set with average for each activity and subject.
Order tidyData according to subject and activity.
Write tidyData into a text file.


