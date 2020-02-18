---
output:
  pdf_document: default
  html_document: default
---
# getting-and-cleaning-data-week-4
week 4 assignment 

This repository was created to complete assignment 4 from the Getting and Cleaning Data course on Coursera 

*Download & unzip the data file in R working directory 
*Download R source code into working directory 
*Execute R source code to create a tidy data text file 

# Data Description # 

The variables in the X file are sensor signals from smartphones of subjects. The Y variables are the activity type. 

## Code Explained ## 

The code was create to merge training and test sets to create one set. Then a new data set was created to extract averages for each variable in relation to each activity 

### New Tidy Dataset ### 

The new dataset is the result of obtaining mean and standard deviation of variables, where each row is the the average of each activity for all subjects. 

The R script named run_analysis.R followed the following directions 1. Merges the training and the test sets to create one data set. 2. Extracts the measurements on the mean and SD for each measurement. 3. Uses descriptive activity names to name the activities in the data set. 4. Appropriately label the data set with descriptive variable names. 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

