run_analysis <- function() {
        ##using plyr package
        library(plyr)
        
        ##Read the test data into data tables
        y_test_DT <- read.table("test/y_test.txt")
        X_test_DT <- read.table("test/X_test.txt")
        subject_test_DT <- read.table("test/subject_test.txt")
        
        ##Read the train data into data tables
        y_train_DT <- read.table("train/y_train.txt")
        X_train_DT <- read.table("train/X_train.txt")
        subject_train_DT <- read.table("train/subject_train.txt")
        
        ## Read the feature names and activity lables into data tables
        features_DT <- read.table("features.txt")
        activity_labels_DT <- read.table("activity_labels.txt")
        
        ## Appropriately label the data sets with descriptive variable names.
        #Apply columnnames from features.txt to the X_test and X_train data
        colnames(X_test_DT) <- features_DT[,"V2"]
        colnames(X_train_DT) <- features_DT[,"V2"]
        
        #Add activity column
        X_test_DT$Activity <- y_test_DT[,"V1"] 
        X_train_DT$Activity <- y_train_DT[,"V1"]
        
        #Add subject column
        X_test_DT$Subject <- subject_test_DT[,"V1"] 
        X_train_DT$Subject <- subject_train_DT[,"V1"]
        
        
        
        ##Merge the training and the test sets to create one data set
        total_X_DT <- rbind(X_test_DT, X_train_DT)
        
        ##Extract only the measurements on the mean and standard deviation for each measurement. 
        ##Also include the Activity and Subject columns        
        xmatches <- c (grep('Activity',colnames(total_X_DT),fixed = TRUE),grep('Subject',colnames(total_X_DT),fixed = TRUE),grep('-mean()',colnames(total_X_DT),fixed = TRUE),grep('-std()',colnames(total_X_DT),fixed = TRUE))
        select_total_X_DT <- total_X_DT[,xmatches]
        
        ##Use descriptive activity names to name the activities in the data set
        activity_hash = new.env(hash=TRUE, parent=emptyenv(), size=6L)
        for( i in 1:nrow(activity_labels_DT))
        {
                assign(toString(i), activity_labels_DT[i,"V2"], activity_hash)
        }
        for( i in 1:nrow(select_total_X_DT))
        { 
                select_total_X_DT[i, 'Activity'] <- toString(get(toString(select_total_X_DT[i,'Activity']),activity_hash))
        }
        
        ##Create a second, independent tidy data set with the average of each 
        ##variable for each activity and each subject
        result.plyr <- ddply( select_total_X_DT, .(Subject,Activity), numcolwise(mean) )
        
        ##Create txt file with write.table() using row.name=FALSE 
        write.table(result.plyr,file= "result.txt", row.names = FALSE)
}
