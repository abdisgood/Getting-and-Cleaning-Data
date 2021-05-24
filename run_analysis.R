
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

        reqheaders <- grepl("*-mean*|*-std*", 
                            names(alldata))
        oldheaders <- data.frame(names(alldata))
        newheaders <- c("subject_id", "activity_id", 
                        oldheaders[reqheaders==T,])
        
        data.mean.std <- select(alldata, newheaders)
        
## Use descriptive activity names to name the activities 
## in the data set and sort by subject and activity
        data.by.activity<- merge(data.mean.std, 
                                 activities, by.y = "activity_id",all =T)%>%
                select(c(2,1,82,3:81))%>%
                arrange (subject_id, activity_id)

## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each 
## variable for each activity and each subject.
        data.aggregate <- aggregate(.~subject_id + activity_id,
                                       data.mean.std, mean)%>%
                        merge (activities, by.y="activity_id", all=T)%>%
                        arrange (subject_id, activity_id)%>%
                        select (subject_id, activity_id, 
                                activity_name, c(3:81))
        
        write.table(data.aggregate,file = "final_dataset.txt",
                    row.names = F,
                    col.names = T)
        