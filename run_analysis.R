#load library 
library (dplyr)

#load/read data 
X_test <-read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <-read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <-read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <-read.table("./UCI HAR Dataset/train/subject_train.txt")
features <-read.table("./UCI HAR Dataset/features.txt")
activity_labels <-read.table("./UCI HAR Dataset/activity_labels.txt")

#merge the training & the test set to create one data set 
X <-rbind(X_train, X_test)
Y <-rbind(Y_train, Y_test)
sub <-rbind(subject_train, subject_test)

#extract only the measurements on the mean & SD for each measurment 
features_extracted <-features[grep("mean\\(\\)|std\\(\\)", features[,2]),]
X <-X[,features_extracted[,1]]

#uses descriptive activity names to name the activities in the data set 
colnames(Y) <-"activity"
Y$activitylabel <-factor(Y$activity, labels = as.character(activity_labels[,2]))
activitylabel <-Y[,-1]

#appropriately labels the data set w/ descriptive variable names 
colnames(X) <-features[features_extracted[,1],2]

#from data set in step 4, create a second, independent tidy data set w/ the average of each variable for each activity & each subject 
colnames(sub) <-"subject"
total <-cbind(X, activitylabel, sub)
total_mean <-total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file="./UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)


