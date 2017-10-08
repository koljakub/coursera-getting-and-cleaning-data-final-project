library(reshape2)

# ---------------------------------------------------------------------------------------------------------
# Data preparation
# Dataset: Human Activity Recognition Using Smartphones Data Set 
# Data source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# ---------------------------------------------------------------------------------------------------------
archive_name <- "har_data.zip"
data_dir_name <- "UCI HAR Dataset"
url_to_file <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(archive_name)) {
  download.file(url_to_file, archive_name, method = "curl")
  if(!file.exists(data_dir_name)) {
    unzip(archive_name)  
  }
}
X_train <- read.table(file = paste(data_dir_name, "/train/X_train.txt", sep = ""))
y_train <- read.table(file = paste(data_dir_name, "/train/y_train.txt", sep = ""))
subject_train <- read.table(file = paste(data_dir_name, "/train/subject_train.txt", sep = ""))
X_test <- read.table(file = paste(data_dir_name, "/test/X_test.txt", sep = ""))
y_test <- read.table(file = paste(data_dir_name, "/test/y_test.txt", sep = ""))
subject_test <- read.table(file = paste(data_dir_name, "/test/subject_test.txt", sep = ""))
activity_labels <- read.table(file = paste(data_dir_name, "/activity_labels.txt", sep = ""),
                              stringsAsFactors = FALSE)[2]
feature_labels <- read.table(file = paste(data_dir_name, "/features.txt", sep = "" ), 
                             stringsAsFactors = FALSE)[2]
feature_labels <- rbind("subject", feature_labels, "activity")

# ---------------------------------------------------------------------------------------------------------
# I. Merge of the training set and the test set
# ---------------------------------------------------------------------------------------------------------
training_set <- cbind(subject_train, X_train, y_train) 
test_set <- cbind(subject_test, X_test, y_test)
dataset <- rbind(training_set, test_set)
colnames(dataset) <- feature_labels$V2

# ---------------------------------------------------------------------------------------------------------
# II. Extraction of the measurements on the mean and standard deviation for each measurement
# ---------------------------------------------------------------------------------------------------------
filtered_colnames <- colnames(dataset)[grepl("subject|mean|std|activity", colnames(dataset))]
dataset <- dataset[, filtered_colnames]

# ---------------------------------------------------------------------------------------------------------
# III. Transformation of the activity IDs
# ---------------------------------------------------------------------------------------------------------
transform_act_id <- function(x) {
  x <- activity_labels$V2[x]
}
dataset$activity <- as.factor(unlist(lapply(dataset$activity, transform_act_id)))

# ---------------------------------------------------------------------------------------------------------
# IV. Transformation of the variable names
# ---------------------------------------------------------------------------------------------------------
colnames(dataset) <- gsub("\\()", "", colnames(dataset))
colnames(dataset) <- gsub("-", "", colnames(dataset))
colnames(dataset) <- gsub("mean", "Mean", colnames(dataset))
colnames(dataset) <- gsub("std", "Std", colnames(dataset))
colnames(dataset) <- gsub("BodyBody", "Body", colnames(dataset))

# ---------------------------------------------------------------------------------------------------------
# V. Tidy dataset creation
# ---------------------------------------------------------------------------------------------------------
molten_dataset <- melt(dataset, id.vars = c("subject", "activity"))
tidy_dataset <- dcast(molten_dataset, subject + activity ~ variable, mean)
write.table(tidy_dataset, "tidy_dataset.txt", row.names = FALSE)