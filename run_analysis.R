
## Merge the training and the test sets to create one data set.

        ## Download data files
        if (!file.exists("./projectdata")) {dir.create("./projectdata")}
        fileurl<-"https://d396qusza40orc.cloudfront.net/
        getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileurl, 
                      destfile = "./projectdata/dataset.zip")
        unzip(zipfile = "./projectdata/dataset.zip", 
              exdir="./projectdata")
        
        ## Read data files in search directories into R objects
        xtrain<-read.table("./projectdata/
                           UCI HAR Dataset/train/x_train.txt")
        ytrain<-read.table("./projectdata/
                           UCI HAR Dataset/train/y_train.txt")
        subjectrain<-read.table("./projectdata/
                           UCI HAR Dataset/train/subject_test.txt")
        
        xtest<-read.table("./projectdata/
                           UCI HAR Dataset/test/x_test.txt")
        ytest<-read.table("./projectdata/
                           UCI HAR Dataset/test/y_test.txt")
        subjecttest<-read.table("./projectdata/
                           UCI HAR Dataset/test/subject_test.txt")
        
        features<- read.table("./projectdata/
                           UCI HAR Dataset/features.txt")
        activities<- read.table("./projectdata/
                           UCI HAR Dataset/activity_labels.txt")
        
        ## Combine all data sets and name columns
        testdata<-cbind(subjecttest,ytest,xtest)
        names(testdata)<-c("subject_id","activity_id",features[,2])
        testdata$group<-"test"
        
        traindata<-cbind(subjecttrain,ytrain,xtrain)
        names(traindata)<-c("subject_id","activity_id",features[,2])
        traindata$group<-"train"
        
        alldata<-rbind(testdata,traindata)
        
## Extract only the measurements on the mean and 
## standard deviation for each measurement. 

## Use descriptive activity names to name the activities 
## in the data set


## Appropriately label the data set with descriptive variable
## names. 


## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each 
## variable for each activity and each subject.