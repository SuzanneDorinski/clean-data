# Welcome to the Code Book
## :boom: Data Dictionary for the "Getting and Cleaning Data" course project. :boom:
### :four_leaf_clover: :four_leaf_clover: :four_leaf_clover: Brought to you by Notepad++, because I have not yet learned R Markdown. :four_leaf_clover:  :four_leaf_clover: :four_leaf_clover:

# Source of the data used in this class project
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

# How I processed the data

I downloaded the zipped source file into the working directory.  The data for the 30 subjects is divided between two data sets:  test and train.  Both the test and train data contain a 561-feature vector.  

The feature names listed in features.txt are not valid names in R.  I converted those feature names to valid variable names in R with the make.names function. 

I read the test data file into a data frame, the subject identifier file into a vector, and the activity identifier file into a vector.  I combined the data into one data frame.  
I followed the same procedure for the train data.  

I combined the data frames.  From the combined data, I selected the subject identifiers, the activity identifiers, and the features that contained a mean or standard deviation of the normalized measurement.
I converted the activity identifiers to factors, using the activity_labels.txt file.  I used the **group_by** function in the **dplyr** package to group the data by subject and activity, then used the
**summarise_each** function to calculate the mean of all the columns in the data frame tbl, excluding the grouping variables.  

I used the **write.table** function to write the summarized data to a text file.  I also used the **write.table** function to write out the column names to a text file, for use in this code book.    

# Description of the summarized data set

The summarized file has 88 variables for 180 observations.  
**subject** ranges from 1 to 30, and represents the adult volunteers aged 19 to 48 in this study.
**activity** has 6 levels:  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

The remaining 86 variables are derived from measurements gathered from the smartphones that study participants wore during the activities.  The smartphones recorded data on the X, Y, and Z axis.  Those measurements were 
normalized and bounded within the interval [-1,1].

This file only includes the measures that were summarized by the calculation of mean or standard deviation.  Please note that this is a summary data set, and the measures are actually the mean of the mean or the mean of the standard deviation by subject and activity level.  This file combines the test and training data.

This file is a tidy data set in the wide form style.  Each subject participated in each activity.  A row in the data set represents the subject's summarized measurements for that activity.  

** List of variables in the *tidy* data file **

subject
activity
tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyAccMag.mean..
tGravityAccMag.mean..
tBodyAccJerkMag.mean..
tBodyGyroMag.mean..
tBodyGyroJerkMag.mean..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.meanFreq...X
fBodyAcc.meanFreq...Y
fBodyAcc.meanFreq...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.meanFreq...X
fBodyAccJerk.meanFreq...Y
fBodyAccJerk.meanFreq...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.meanFreq...X
fBodyGyro.meanFreq...Y
fBodyGyro.meanFreq...Z
fBodyAccMag.mean..
fBodyAccMag.meanFreq..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.meanFreq..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.meanFreq..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.meanFreq..
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.std..
tGravityAccMag.std..
tBodyAccJerkMag.std..
tBodyGyroMag.std..
tBodyGyroJerkMag.std..
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.std..
fBodyBodyAccJerkMag.std..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.std..
