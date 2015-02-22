# This is the README.md file

This is my course project for the "Getting and Cleaning Data" class, part of the Data Science Specialization offered by Johns Hopkins
on Coursera.  

The project due date is Sunday February 22, 2015.

# Data source:
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

##This repo contains 4 files:
### * run_analysis.R
### * CodeBook.md
### * tidy_end_result.txt
### * README.md.

This README.md file explains the other 3 files.  

**run_analysis.R** is the R script that I wrote to process the source data.  The script includes the R commands to download the zipped file to the working directory on a Windows pc.  If the user already has
the data file unzipped, the user can submit lines 18 through 81 to do the processing.  Line 85 of the script writes the tidy data set to a text file, while lines 91 - 92 of the script write the column names 
to a text file for use in building the code book.

**CodeBook.md** is the code book for this project.  The code book contains an explanation of the processing, along with a list of the variables in the tidy summarized data set.

**tidy_end_result.txt** is a delimited text file, created by line 85 of the R script.  It's the tidy wide form of the summarized data, and was also uploaded on the course project section of the class web site.  

# How I processed the data

I downloaded the zipped source file into the working directory.  The data for the 30 subjects is divided between two data sets:  test and train.  Both the test and train data contain a 561-feature vector.  

The feature names listed in features.txt are not valid names in R.  I converted those feature names to valid variable names in R with the **make.names** function. 

I read the test data file into a data frame, the subject identifier file into a vector, and the activity identifier file into a vector.  I combined the data into one data frame.  
I followed the same procedure for the train data.  

I combined the data frames.  From the combined data, I selected the subject identifiers, the activity identifiers, and the features that contained a mean or standard deviation of the normalized measurement.
I converted the activity identifiers to factors, using the activity_labels.txt file.  I used the **group_by** function in the **dplyr** package to group the data by subject and activity, then used the
**summarise_each** function to calculate the mean of all the columns in the data frame tbl, excluding the grouping variables.  

I used the **write.table** function to write the summarized data to a text file.  I also used the **write.table** function to write out the column names to a text file, for use in the code book.    