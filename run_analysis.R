
## Merge the training and the test sets to create one data set.

        ## Establish search directories
        dirmain<-getwd()
        dirdata<-paste(dirmain,"/UCI HAR Dataset",sep="")
        dirtest<-paste(dirdata,"/test", sep="")
        dirtrain<-paste(dirdata, "/train",sep="")
        dirtestsign<-paste(dirtest,"/Inertial Signals", sep="")
        dirtrainsign<-paste(dirtrain,"/Inertial Signals", sep="")
        
        filetest<-list.files(dirtest)
        filetrain<-list.files(dirtrain)
        filetestsign<-list.files(dirtestsign)
        filetrainsign<- list.files (dirtrainsign)

        ## Read data files in search directories into R objects
        
        
## Extract only the measurements on the mean and 
## standard deviation for each measurement. 

## Use descriptive activity names to name the activities 
## in the data set


## Appropriately label the data set with descriptive variable
## names. 


## From the data set in step 4, creates a second, 
## independent tidy data set with the average of each 
## variable for each activity and each subject.