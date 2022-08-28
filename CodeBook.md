#### This CodeBook describes the data, variables, transformations and work done in the project

## The source data
The source data are from the Human Activity Recognition Using Smartphones Data Set. 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Per the authors, "The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

The data for the project is dowloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## The Script
The "run_analysis.R" R code file performs the following steps:
    1. Import dplyr from the library
    2. Download the data from the above indicated URL.   
    3. Read read the training and test data files, as well as the features and measured activities files.
    4. Merge the training and test data sets into one data file using cbind(). 
    5. Subset only the measurements on the mean and standard deviation for each measurement using grepl().
    6. Apply descriptive activity names from the activity_labels.txt file to name the activities in the data set.   
    7. Make changes to the labels to facilitate readibility. 
    5. Create an independent tidy data set text file with the average of each variable for each activity and each subject.

## About variables:   
1. `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
2. `x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
3. `features` contains the names for the `x_data` dataset.
4. activity_labels lists the activities measured on each subject.

## Create the tinyData.txt deliverable:
1. Download data from the GitHub repository and unzip it into working directory of R Studio.
2. Execute the R script.
Note: An alternative run_analysis.ipynb Jupyter Notebook has been created that can also be used to create the tidy_data.txt file. It can be run for comparison purposes. Not that R and Jupyter Notebooks will run in separate and independent workspaces.

