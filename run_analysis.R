
## Merge the training and the test sets to create one data set.
        ## Load required libraries
        if (!"dplyr" %in% rownames(installed.packages())) {
                install.packages("dplyr")}
        if (!"plyr" %in% rownames(installed.packages())) {
                install.packages("plyr")}
        if (!"reshape2" %in% rownames(installed.packages())) {
                install.packages("reshape2")}
        library(dplyr)
        library(plyr)
        library(reshape2)

        ## Download data files
        if (!file.exists("./projectdata")) {dir.create("./projectdata")}
        fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl, 
                      destfile = "./projectdata/dataset.zip")
        unzip(zipfile = "./projectdata/dataset.zip", 
              exdir="./projectdata")
        
        ## Read data files in search directories into R objects
        xtrain<-
                read.table("./projectdata/UCI HAR Dataset/train/x_train.txt")
        ytrain<-
                read.table("./projectdata/UCI HAR Dataset/train/y_train.txt")
        subjectrain<-
                read.table("./projectdata/UCI HAR Dataset/train/subject_train.txt")
        
        xtest<-
                read.table("./projectdata/UCI HAR Dataset/test/x_test.txt")
        ytest<-
                read.table("./projectdata/UCI HAR Dataset/test/y_test.txt")
        subjecttest<-
                read.table("./projectdata/UCI HAR Dataset/test/subject_test.txt")
        
        features<- 
                read.table("./projectdata/UCI HAR Dataset/features.txt")
        activities<- 
                read.table("./projectdata/UCI HAR Dataset/activity_labels.txt")
        names(activities)<- c("activity_id", "activity_name")
        
        ## Combine all data sets and name columns with appropriate 
        ## descriptive variables
        testdata<-cbind(subjecttest,ytest,xtest)
        names(testdata)<-c("subject_id","activity_id",features[,2])
        
        traindata<-cbind(subjecttrain,ytrain,xtrain)
        names(traindata)<-c("subject_id","activity_id",features[,2])
        
        alldata<-rbind(testdata,traindata)
        
## Extract only the measurements on the mean and 
## standard deviation for each measurement. 

        data.mean.std <- select(alldata, subject_id, activity_id,
                                contains("mean()"), 
                                contains("std()"))
        
## Use descriptive activity names to name the activities 
## in the data set and sort by subject and activity
        data.by.activity<- merge(data.mean.std, 
                                 activities, by.y = "activity_id",all =T)%>%
                           select(c(subject_id,activity_id,
                                    activity_name,3:68))%>%
                           arrange (subject_id, activity_id)

## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each 
## variable for each activity and each subject.
        ## Combine all data into final data set and sort column headers
        data.aggregate <- aggregate(.~subject_id + activity_id,
                                       data.mean.std, mean)%>%
                        merge (activities, by.y="activity_id", all=T)%>%
                        arrange (subject_id, activity_id)%>%
                        select (subject_id,activity_name, 
                                (3:69))
        
        cheaders<-sort(names(data.aggregate[3:68]))
        data.aggregate <- select(data.aggregate,
                                 subject_id, 
                                 activity_name, 
                                 cheaders)
        
        ## Rename all row headers to improve readability
        
        names(data.aggregate)<-gsub("[[:punct:]]", "", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Acc", "_accelerometer", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Gyro", "_gyroscope", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("BodyBody", "_body", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Body", "_body", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Mag", "_magnitude", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Jerk", "_jerk", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Gravity", "_gravity", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("^t", "time", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("^f", "frequency", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("mean", "_mean", 
                                    names(data.aggregate), 
                                    ignore.case = TRUE)
        names(data.aggregate)<-gsub("std", "_std", 
                                    names(data.aggregate), 
                                    ignore.case = TRUE)
        names(data.aggregate)<-gsub("angle", "_angle", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("X", "_X", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Y", "_Y", 
                                    names(data.aggregate))
        names(data.aggregate)<-gsub("Z", "_Z", 
                                    names(data.aggregate))
        
        ## Write final data set into a "txt" file format
        write.table(data.aggregate,file = "final_dataset.txt",
                    row.names = F)
        