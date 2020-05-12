library('reshape2')

#downloading the file
filename <- 'project.zip'

if (!file.exists(filename)){
   download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
               filename,method ='curl')
}

mydirectory <- 'C://Users//HP//Desktop//RPractice'

#unzip the file
if (!file.exists(mydirectory)){
  unzip(filename)
}


#train data

train_x <- read.table( "train/X_train.txt")
train_y <- read.table("train/Y_train.txt")
train_sub <- read.table("train/subject_train.txt")

# test data
test_x <- read.table("test/X_test.txt")
test_y <- read.table("test/Y_test.txt")
test_sub <- read.table ("test/subject_test.txt")

# merging train and test data
x_data <- rbind(train_x, test_x)
y_data <- rbind(train_y, test_y)
s_data <- rbind(train_sub, test_sub)

#reading feature names
feature_names <- read.table("features.txt")
feature_names <- as.character(feature_names[,2])


#reading activity labels from the file
act_label <- read.table("activity_labels.txt")
act_label <- as.character(act_label[,2])

#finding the feature names, only holding the "mean" and "std" string
find_matched_cols <- grep("-(mean|std).*", feature_names)
matched_col_names <- feature_names[selectedCols]

#replacing those feature names with with 'Mean' and 'Std'
matched_col_names <- gsub("-mean", "Mean", matched_col_names)
matched_col_names <- gsub("-std", "Std", matched_col_names)

#also removing '-()' string in feature names with empty string
matched_col_names <- gsub("[-()]", "", matched_col_names)

#select only matched columns selected from feature names
x_data <- x_data[find_matched_cols]

#merging all the data and putting descriptive activity names and feature names also
#labels the data set with descriptive variable names.
final_data <- cbind(s_data, y_data, x_data)
colnames(final_data) <- c("Subject", "Activities", matched_col_names)

final_data$Activities <- factor(final_data$Activities, levels = act_label[,1], labels = act_label[,2])
final_data$Subject <- as.factor(final_data$Subject)

#making up tidy data
meltedData <- melt(final_data, id = c("Subject", "Activities"),variable.name = "Measurement_variable", value.name="Reading")
tidyData <- dcast(meltedData, Subject + Activities ~ Measurement_variable, mean)

#writing the tidy data to file 
write.table(tidyData, "C://Users//HP//Desktop//RPractice//project//tidy_dataset.txt")




