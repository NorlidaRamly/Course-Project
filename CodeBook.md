This is a code book that describes the variables, data and transformations work:

Dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The datasets contains 6 activities: (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
The dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data



The variables

The data

Transformations or work that being performed to clean up the data.
Package:  data.table package

Test dataset

• The test datasets is stored in the TEST folder

• It consists of the subject_test.txt, X_test.txt and y_test.txt files

• Read all 3 files

• Label X_test columns according to the features.txt

• Select only “mean” and “std” features from X_test

• Label Y_test column as “Activity ID” and “Activity Label”

• Label Subject_test column as “Subject”

• Combine all three into one dataset
