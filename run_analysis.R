library(dplyr)

# PROJECT - 03 GETTING AND CLEANING DATA


# Setting Working Directory

setwd('C:\\R\\Coursera\\3_GettingAndCleaningData\\Project')


if(!dir.exists("UCI HAR Dataset")) {
  stop("Download and unpack project data!")
}



#Reading the data
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features <- features$V2

alabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(alabels) <- c("id", "Activity")

# Read test-data
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
names(test_y) <- "id"

# Read train-data
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
names(train_y) <- "id"


# Activity data - merge in activity name
z1 <- merge(x = test_y, y = alabels, by="id", all = TRUE)
z2 <- merge(x = train_y, y = alabels, by="id", all = TRUE)


# Collect to one dataset
d1 <- cbind(test_subject, z1, test_x)
d2 <- cbind(train_subject, z2, train_x)

# Step 3 and 4 - descriptive names
names(d1) <- c("Subject", "acid", "Activity", features)
names(d2) <- c("Subject", "acid", "Activity", features)

# Collecting to one dataset
dataset <- rbind(d1, d2)

# Identify which columns contain mean og std
ind1 <- grep("mean()", features, fixed="TRUE")
ind2 <- grep("std()", features, fixed="TRUE")


# Include -2, -1, 0 and then add 3 to all indices. Necessary since we added
# the columns "Users", "acid" and "Activity". 
ind3 <- c(-2, -1, 0, unique(sort(c(ind1, ind2))))+3

###################################################################### Dataset

dataset <- dataset[,ind3]
# Remove Activity ID.
dataset <- select(dataset, -acid)

# No missing values. The following returns TRUE:
# all(colSums(is.na(dataset))==0)



# Creating subset with means of data.

# Rename columns - adding the prefix "mean_" to every column with a value
temp <- names(dataset)
temp = temp[3:length(temp)]
temp <- paste0('mean_', temp)
temp <- c("Subject", "Activity", temp)

n = length(dataset)

datamean <- aggregate(cbind(dataset[,3:n]),
                      by=list(dataset$Subject, dataset$Activity),
                      FUN = mean)

###################################################################### Datamean
names(datamean) <- temp
datamean <- arrange(datamean, Subject, Activity)

# Store as CSV
# write.csv(dataset, "dataset.csv")
# write.csv(datamean, "datamean.csv")
