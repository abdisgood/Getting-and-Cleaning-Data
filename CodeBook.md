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
In the final step, this data set is aggregated to determine mean values of all features by activity factor levels for all subjects. Data headers are then sorted alphabetically and cleaned for better readability. This final data is exported into a "txt" formal for ready reference.

### Variables

 1. "subject_id"               -        Index between 1 and 30, representing each participant.              
 2. "activity_name"            -        Description of participant state during activity.                
 3. "frequency_body_accelerometer_mean_X"             
 4. "frequency_body_accelerometer_mean_Y"             
 5. "frequency_body_accelerometer_mean_Z"             
 6. "frequency_body_accelerometer_std_X"              
 7. "frequency_body_accelerometer_std_Y"              
 8. "frequency_body_accelerometer_std_Z"              
 9. "frequency_body_accelerometer_jerk_mean_X"        
10. "frequency_body_accelerometer_jerk_mean_Y"        
11. "frequency_body_accelerometer_jerk_mean_Z"        
12. "frequency_body_accelerometer_jerk_std_X"         
13. "frequency_body_accelerometer_jerk_std_Y"         
14. "frequency_body_accelerometer_jerk_std_Z"         
15. "frequency_body_accelerometer_magnitude_mean"     
16. "frequency_body_accelerometer_magnitude_std"      
17. "frequency_body_accelerometer_jerk_magnitude_mean"
18. "frequency_body_accelerometer_jerk_magnitude_std" 
19. "frequency_body_gyroscope_jerk_magnitude_mean"    
20. "frequency_body_gyroscope_jerk_magnitude_std"     
21. "frequency_body_gyroscope_magnitude_mean"         
22. "frequency_body_gyroscope_magnitude_std"          
23. "frequency_body_gyroscope_mean_X"                 
24. "frequency_body_gyroscope_mean_Y"                 
25. "frequency_body_gyroscope_mean_Z"                 
26. "frequency_body_gyroscope_std_X"                  
27. "frequency_body_gyroscope_std_Y"                  
28. "frequency_body_gyroscope_std_Z"                  
29. "time_body_accelerometer_mean_X"                  
30. "time_body_accelerometer_mean_Y"                  
31. "time_body_accelerometer_mean_Z"                  
32. "time_body_accelerometer_std_X"                   
33. "time_body_accelerometer_std_Y"                   
34. "time_body_accelerometer_std_Z"                   
35. "time_body_accelerometer_jerk_mean_X"             
36. "time_body_accelerometer_jerk_mean_Y"             
37. "time_body_accelerometer_jerk_mean_Z"             
38. "time_body_accelerometer_jerk_std_X"              
39. "time_body_accelerometer_jerk_std_Y"              
40. "time_body_accelerometer_jerk_std_Z"              
41. "time_body_accelerometer_jerk_magnitude_mean"     
42. "time_body_accelerometer_jerk_magnitude_std"      
43. "time_body_accelerometer_magnitude_mean"          
44. "time_body_accelerometer_magnitude_std"           
45. "time_body_gyroscope_mean_X"                      
46. "time_body_gyroscope_mean_Y"                      
47. "time_body_gyroscope_mean_Z"                      
48. "time_body_gyroscope_std_X"                       
49. "time_body_gyroscope_std_Y"                       
50. "time_body_gyroscope_std_Z"                       
51. "time_body_gyroscope_jerk_mean_X"                 
52. "time_body_gyroscope_jerk_mean_Y"                 
53. "time_body_gyroscope_jerk_mean_Z"                 
54. "time_body_gyroscope_jerk_std_X"                  
55. "time_body_gyroscope_jerk_std_Y"                  
56. "time_body_gyroscope_jerk_std_Z"                  
57. "time_body_gyroscope_jerk_magnitude_mean"         
58. "time_body_gyroscope_jerk_magnitude_std"          
59. "time_body_gyroscope_magnitude_mean"              
60. "time_body_gyroscope_magnitude_std"               
61. "time_gravity_accelerometer_mean_X"               
62. "time_gravity_accelerometer_mean_Y"               
63. "time_gravity_accelerometer_mean_Z"               
64. "time_gravity_accelerometer_std_X"                
65. "time_gravity_accelerometer_std_Y"                
66. "time_gravity_accelerometer_std_Z"                
67. "time_gravity_accelerometer_magnitude_mean"       
68. "time_gravity_accelerometer_magnitude_std"