Skip to content
Personal Open source Business Explore
Sign upSign inPricingBlogSupport
This repository
Search
Watch 2  Star 3  Fork 156 OscarPDR/Coursera-Getting-and-Cleaning-Data-Course-Project
Code  Issues 0  Pull requests 0  Pulse  Graphs
Branch: master Find file Copy pathCoursera-Getting-and-Cleaning-Data-Course-Project/run_analysis.R
cf05e92  Aug 24, 2014
@OscarPDR OscarPDR Added missing library
1 contributor
RawBlameHistory     69 lines (48 sloc)  2.13 KB
library(plyr)

# Step 1
# Merging the training and test sets to create one dataset

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Creating a x data dataset
x_data <- rbind(x_train, x_test)

# Creating a y data dataset
y_data <- rbind(y_train, y_test)

# Creating a subject dataset
subject_data <- rbind(subject_train, subject_test)

# Step 2
# Extracting only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# Getting only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# Subsetting the desired columns with mean and standard deviation.
x_data <- x_data[, mean_and_std_features]

# Correcting the column names
names(x_data) <- features[mean_and_std_features, 2]

# Step 3
# Using descriptive activity names to name the activities in the data set

# Reading activities dataset.
activities <- read.table("activity_labels.txt")

# Updating values with correct activity names as per instructions.
y_data[, 1] <- activities[y_data[, 1], 2]

# Correcting the column name as before
names(y_data) <- "activity"

# Step 4
# Appropriately labelling the data set with descriptive variable names


# Correct column names as before
names(subject_data) <- "subject"

# Binding all the data into a single dataset
all_data <- cbind(x_data, y_data, subject_data)

# Step 5
# Creating a second, independent tidy dataset with the average of each variable
# for each activity and each subject

# 66 <- 68 columns but last two (activity & subject)
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Creating the dataset
write.table(averages_data, "averages_data.txt", row.name=FALSE)