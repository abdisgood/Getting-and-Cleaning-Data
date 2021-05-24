---
title: "CodeBook"
author: "Syed Abdullah Hasan"
date: "5/23/2021"
output: html_document
---

### Project Scope

The project scope includes cleaning and preparation of a data set covering features on observations derived from gyroscope and accelerometer readings on 30 participants wearing mobile devices across a number of different activity states.

### Data Structure
All data files are encoded in *.txt format. The overall hierarchy for the data set is structured in two sets of data for test and train cases. Each set includes files on features (X_test, X_train), activities (Y_test, Y_train), and subjects (subjects_test, subjects_train). 

The features data are derived from individual observations taken using the accelerometer and gyroscope for the study participants. All observations are taken along the x, y and z axis, therefore constituting a set of three variables for a single measurement. There are three sets of meeasurements in total, including body acceleration, total acceleration and angular velocity. 

Each file contains observations for a single variable (total acceleration, body acceleration or gyroscope reading) along a single dimension (x, y, z), with each row constituting a 128 element vector. These include the smartphone and body accelerometer measurements in gravity units ('g'), and finally the angular velocity observed from the gyroscope for each window sample, recorded in radians per second('radians / second').

These observation files are to be ignored for data processing. However, the observation files are used to calculate 561 statistical features which are to be combined for both the test and train cases into a single data object to conduct further analysis.  

### Methodology
##### Step 1
The [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) for the project is downloaded and unzipped into a working folder called "Projectdata" for ready reference.

##### Step 2
All relevant data files are then read into R objects for further analysis, including:
1. X_train.txt
2. Y_train.txt
3. Subject_train.txt
4. X_test.txt
5. Y_test.txt
6. Subject_test.txt
7. Features.txt
8. Activity_labels.txt

##### Step 3
Files 1 - 3 and files 4 - 6 are thereafter joined by columns to create temporary datasets. These data sets are thereafter combined by rows to yield the full combined data set. 

##### Step 4
The column headers for the data set are then set based on the file 7 and non-relevant column headers excluded so that only the mean and standard deviation features remain within the data set. 

##### Step 5
Next, activity labels are included in the data set by merging with data from file 8.

##### Step 6
In the final step, this data set is aggregated to determine mean values of all features by activity factor levels for all subjects. This final data is exported into a "txt" formal for ready reference.

### Variables

 1. "subject_id"               -        Index between 1 and 30, representing each participant.              
 2. "activity_id"              -        Index between 1 and 6, representing state of participant.                    
 3. "activity_name"            -        Description of participant state during activity.                
 4. "tBodyAcc-mean()-X             
 5. "tBodyAcc-mean()-Y"              
 6. "tBodyAcc-mean()-Z"              
 7. "tBodyAcc-std()-X"               
 8. "tBodyAcc-std()-Y"               
 9. "tBodyAcc-std()-Z"               
10. "tGravityAcc-mean()-X"           
11. "tGravityAcc-mean()-Y"           
12. "tGravityAcc-mean()-Z"           
13. "tGravityAcc-std()-X"            
14. "tGravityAcc-std()-Y"            
15. "tGravityAcc-std()-Z"            
16. "tBodyAccJerk-mean()-X"          
17. "tBodyAccJerk-mean()-Y"          
18. "tBodyAccJerk-mean()-Z"          
19. "tBodyAccJerk-std()-X"           
20. "tBodyAccJerk-std()-Y"           
21. "tBodyAccJerk-std()-Z"           
22. "tBodyGyro-mean()-X"             
23. "tBodyGyro-mean()-Y"             
24. "tBodyGyro-mean()-Z"             
25. "tBodyGyro-std()-X"              
26. "tBodyGyro-std()-Y"              
27. "tBodyGyro-std()-Z"              
28. "tBodyGyroJerk-mean()-X"         
29. "tBodyGyroJerk-mean()-Y"         
30. "tBodyGyroJerk-mean()-Z"         
31. "tBodyGyroJerk-std()-X"          
32. "tBodyGyroJerk-std()-Y"          
33. "tBodyGyroJerk-std()-Z"          
34. "tBodyAccMag-mean()"             
35. "tBodyAccMag-std()"              
36. "tGravityAccMag-mean()"          
37. "tGravityAccMag-std()"           
38. "tBodyAccJerkMag-mean()"         
39. "tBodyAccJerkMag-std()"          
40. "tBodyGyroMag-mean()"            
41. "tBodyGyroMag-std()"             
42. "tBodyGyroJerkMag-mean()"        
43. "tBodyGyroJerkMag-std()"         
44. "fBodyAcc-mean()-X"              
45. "fBodyAcc-mean()-Y"              
46. "fBodyAcc-mean()-Z"              
47. "fBodyAcc-std()-X"               
48. "fBodyAcc-std()-Y"               
49. "fBodyAcc-std()-Z"               
50. "fBodyAcc-meanFreq()-X"          
51. "fBodyAcc-meanFreq()-Y"          
52. "fBodyAcc-meanFreq()-Z"          
53. "fBodyAccJerk-mean()-X"          
54. "fBodyAccJerk-mean()-Y"          
55. "fBodyAccJerk-mean()-Z"          
56. "fBodyAccJerk-std()-X"           
57. "fBodyAccJerk-std()-Y"           
58. "fBodyAccJerk-std()-Z"           
59. "fBodyAccJerk-meanFreq()-X"      
60. "fBodyAccJerk-meanFreq()-Y"      
61. "fBodyAccJerk-meanFreq()-Z"      
62. "fBodyGyro-mean()-X"             
63. "fBodyGyro-mean()-Y"             
64. "fBodyGyro-mean()-Z"             
65. "fBodyGyro-std()-X"              
66. "fBodyGyro-std()-Y"              
67. "fBodyGyro-std()-Z"              
68. "fBodyGyro-meanFreq()-X"         
69. "fBodyGyro-meanFreq()-Y"         
70. "fBodyGyro-meanFreq()-Z"         
71. "fBodyAccMag-mean()"             
72. "fBodyAccMag-std()"              
73. "fBodyAccMag-meanFreq()"         
74. "fBodyBodyAccJerkMag-mean()"     
75. "fBodyBodyAccJerkMag-std()"      
76. "fBodyBodyAccJerkMag-meanFreq()" 
77. "fBodyBodyGyroMag-mean()"        
78. "fBodyBodyGyroMag-std()"         
79. "fBodyBodyGyroMag-meanFreq()"    
80. "fBodyBodyGyroJerkMag-mean()"    
81. "fBodyBodyGyroJerkMag-std()"     
82. "fBodyBodyGyroJerkMag-meanFreq()"
