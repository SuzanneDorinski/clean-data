# this is run_analysis.R

# this program assumes that the zipped file will be downloaded into the 
# user's working directory.  note that this script contains the commands 
# to download the zipped file on a Windows pc. Start with line 18 if 
# you do not wish to download the zipped file.  

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, "Dataset.zip")

dateDownloaded <- date()

dateDownloaded

unzip("Dataset.zip")

library(dplyr)

# read features.txt and make valid names 

features <- read.table("./UCI HAR Dataset/features.txt")

features$V2 <- make.names(features$V2, unique=TRUE)

# start with test data

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(X_test) <- features$V2

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- c("subject")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
colnames(y_test) <- c("activity")

test <- tbl_df(bind_cols(subject_test, y_test, X_test))

# now work with train data

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(X_train) <- features$V2

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- c("subject")

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(y_train) <- c("activity")

train <- tbl_df(bind_cols(subject_train, y_train, X_train))

# combine the test and train data sets

test_and_train <- bind_rows(test,train)

# choose the mean and standard deviation measurements 

mean_vars <- select(test_and_train, contains("mean"))
std_vars <- select(test_and_train, contains("std"))
ids <- select(test_and_train, subject, activity)

our_subset <- tbl_df(bind_cols(ids, mean_vars, std_vars))

# make sure the activity uses the text label rather
# than the integer code 

activity_codes <- read.table("./UCI HAR Dataset/activity_labels.txt")

our_subset$activity <- factor(our_subset$activity,
                              levels= activity_codes$V1,
                              labels = activity_codes$V2)

# we want to summarize the data by subject and activity

by_subject_and_activity <- group_by(our_subset,subject,activity)

# need to use summarise_each (British spelling!) to get the mean
# for multiple columns.  grouping variables are excluded.  had to
# look up documentation to get syntax correct. 

end_result <- summarise_each(by_subject_and_activity, funs(mean))

# now produce text file of the tidy data set

write.table(end_result, "tidy_end_result.txt", row.names=FALSE)

# write out some information for the code book 
# quote=FALSE will write out the variable names without
# double quotes around them.

write.table(colnames(end_result),"variable_names_for_code_book.txt", sep="\n",
            row.names=FALSE, quote=FALSE)