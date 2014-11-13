DS_Course3_Project
==================

Data Sceince Coursera Course 3: Project
Script name : run_analysis.R

Requirements for running the run_analysis.R script:
1. R version 3.1.1 
2. "plyr" package downloaded
3. Data should be in the same directory as the script. The working directory should have the following structure:

  run_analysis.R
  
  activity_labels.txt
  
  features.txt
  
  /test (This directory should contain subject_test.txt, X_test.txt,y_test.txt)
  
  /train (This directory should contain subject_train.txt, X_train.txt,y_train.txt)
  

Instructions to run the script do the following:

  source ("run_analysis.R")
  
  run_analysis()
  
  
Description of what the script does:

1. Reads test and train data
2. Appropriately labels the data sets with descriptive variable names. Applies columnnames from features.txt to the X_test and X_train data.
3. Adds activity column to both test and train data
4. Adds subject column to both test and train data
5. Merges the training and the test sets to create one data set
6. Extracts only the measurements on the mean and standard deviation for each measurement. Also include the Activity and Subject columns. NOTE: Includes only -mean() and -std() variables for each signal. The -meanFreq() variable is not included.
7. Uses descriptive activity names to name the activities in the data set.
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
9. Create txt file names result.txt in the working directory with write.table() using row.name=FALSE 

