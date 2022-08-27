# Data Getting and Cleaning
# Course Project


#1. Create script and setup project
# Import package
library(dplyr)

# Data source URL
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Download and unzip the data file
if (!file.exists("data")) { dir.create("data")}
if (!file.exists("./Dataset.zip")) { download.file(fileUrl, destfile = "./data/Dataset.Zip") }
unzip("./data/Dataset.zip", files = NULL, list = FALSE, overwrite = TRUE, exdir = ".")

setwd("UCI HAR Dataset")

# Read training data 
x_train   <- read.table("./train/X_train.txt")
y_train   <- read.table("./train/Y_train.txt") 
subject_train <- read.table("./train/subject_train.txt")
# Read test data 
x_test   <- read.table("./test/X_test.txt")
y_test   <- read.table("./test/Y_test.txt") 
subject_test <- read.table("./test/subject_test.txt")

# read features description 
features <- read.table("./features.txt", as.is = TRUE)

# read activity labels 
activity_labels <- read.table("./activity_labels.txt") 
colnames(activity_labels) <- c("Id", "activityLabel")

# 2. Merge the Training and Test sets
x_total   <- rbind(x_train, x_test)
y_total   <- rbind(y_train, y_test) 
subject_total <- rbind(subject_train, subject_test) 

# combine into a frame
MergedData <- cbind( subject_total, x_total, y_total)
colnames(MergedData) <- c("subject", features[,2],"activity")
head(MergedData)

# 3. Extract the measurements on the mean and standard deviation for each measurement
# Apply grep logical to subset columns subject, activity, and those containing meqn and std
 MergedData <- MergedData[, grepl("subject|activity",colnames(MergedData))|
                               grepl("mean", colnames(MergedData))|grepl("std", colnames(MergedData))]

# 4. Use descriptive activity names to name activities in the data set
MergedData$activity <- factor(MergedData$activity, levels = activity_labels[,1], 
                              labels = activity_labels[,2])

# 5. Appropriately label data set with descriptive variable names
# get column names
MergedDataCols <- colnames(MergedData)

# clean and clarify names
MergedDataCols <- gsub("^f", "frequency", MergedDataCols)
MergedDataCols <- gsub("^t", "time", MergedDataCols)
MergedDataCols <- gsub("Acc", "Accelerometer", MergedDataCols)
MergedDataCols <- gsub("Gyro", "Gyroscope", MergedDataCols)
MergedDataCols <- gsub("Mag", "Magnitude", MergedDataCols)
MergedDataCols <- gsub("Freq", "Frequency", MergedDataCols)
MergedDataCols <- gsub("mean", "Mean", MergedDataCols)
MergedDataCols <- gsub("std", "StandardDev", MergedDataCols)

# fix BodyBody typo
MergedDataCols <- gsub("BodyBody", "Body",MergedDataCols)
head(MergedData)

# use new labels as column names
colnames(MergedData) <- MergedDataCols

ActivityMeans <- MergedData %>% group_by(subject, activity) %>% summarize_each(list(mean = mean))

# Crear archivo txt
write.table(ActivityMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)
