# Getting-and-Cleaning-Data
## Week 4 Course Project

The goal of this project is to prepare a tidy data that can be used for later analysis.
The data is sourced from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
The zip file contains a number of files with test and training sets as well as dataframe label information. 

The deliverable of the project is a run_analysis.R script file that:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
# Files
Included in this repository are:
1. Readme.md -> This file, a general description of the project.
2. CodeBook.md -> Contains indications on use of the script, as well as descriptions of the variables, the data and work performed.
3. run_analysis.ipynb -> A Jupyter Notebook version of the script.
4. run_analysis.R -> The R script file to deliver the project's requirements.
5. tidy_data.txt -> The requested data set in tidy format.

The run_analysis.ipnyb file is not required by the project, but developing the code in Jupyter Notebook is very helpful as it allows immediate testing of the lines of code.Once ready, the code is easily copied and pasted to RStudio.
