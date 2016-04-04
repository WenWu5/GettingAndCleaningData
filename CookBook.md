Project steps:

Files used in project:
	- UCI HAR Dataset
		- test folder: contains data from test. subject_test.txt, X_test.txt, y_test.txt
		- train folder: contains data from train. subject_train.txt, X_train.txt, y_train.txt
		- activity_labels.txt: contains mapping between activity names to integer value
		- features.txt: experiment variable names

Steps taken to generate run_analysis.R

Methods applied in run_analysis.R:

1. Merges the training and the test sets to create one data set. (Part 1)
	- check if "UCI HAR Dataset" exists in /Coursera/data folder. If not, download from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	- read in test/train data text files from test/train folders
	- row bind test and train data sets to get one combined dataset
	- the combined dataset is stored in variable "mergedDT"
 
2. Extracts only the measurements on the mean and standard deviation for each measurement. (Part 2)
	- rename variables in "mergedDT" to readable names. The names were read from features.txt.
	- using grep, keep only variable names that contains "mean" or "std". Subjects and Activities are kept as well.
	- resulting renamed datable is stored in "mergedDT"
	
3. Uses descriptive activity names to name the activities in the data set. (Part 3)
	- read in activity_labels.txt to "activityNames". Use this to rename "Activity" column based on "ActivityName" by their integer value.
	- result datable stored in "mergedDT"

4. Appropriately labels the data set with descriptive variable names. (Part 4)
	- use gsub to rename variable name abbreviations. EX. from "t" to "time", etc

	
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (Part 5)
	- using aggregate, calculate averages for each subject/activity combinations.
	- resulting datable written to /Coursera/data/tidyDataAverageForSubjectAndActivity.txt

Description of tidyDataAverageForSubjectAndActivity.txt
	- data table of dimension 180 observations x 68 variables
	- Variables: "Subject" - subject number used in experiment, "Activity" - activity taken by the subject,
	- tidyData <- read.table("./Coursera/data/tidyDataAverageForSubjectAndActivity.txt"), names(tidyData)
	 [1] "activity"                                           
	 [2] "subject"                                           
	 [3] "timeBodyAccelerometer.mean...X"                    
	 [4] "timeBodyAccelerometer.mean...Y"                    
	 [5] "timeBodyAccelerometer.mean...Z"                    
	 [6] "timeBodyAccelerometer.std...X"                     
	 [7] "timeBodyAccelerometer.std...Y"                     
	 [8] "timeBodyAccelerometer.std...Z"                     
	 [9] "timeGravityAccelerometer.mean...X"                 
	[10] "timeGravityAccelerometer.mean...Y"                 
	[11] "timeGravityAccelerometer.mean...Z"                 
	[12] "timeGravityAccelerometer.std...X"                  
	[13] "timeGravityAccelerometer.std...Y"                  
	[14] "timeGravityAccelerometer.std...Z"                  
	[15] "timeBodyAccelerometerJerk.mean...X"                
	[16] "timeBodyAccelerometerJerk.mean...Y"                
	[17] "timeBodyAccelerometerJerk.mean...Z"                
	[18] "timeBodyAccelerometerJerk.std...X"                 
	[19] "timeBodyAccelerometerJerk.std...Y"                 
	[20] "timeBodyAccelerometerJerk.std...Z"                 
	[21] "timeBodyGyroscope.mean...X"                        
	[22] "timeBodyGyroscope.mean...Y"                        
	[23] "timeBodyGyroscope.mean...Z"                        
	[24] "timeBodyGyroscope.std...X"                         
	[25] "timeBodyGyroscope.std...Y"                         
	[26] "timeBodyGyroscope.std...Z"                         
	[27] "timeBodyGyroscopeJerk.mean...X"                    
	[28] "timeBodyGyroscopeJerk.mean...Y"                    
	[29] "timeBodyGyroscopeJerk.mean...Z"                    
	[30] "timeBodyGyroscopeJerk.std...X"                     
	[31] "timeBodyGyroscopeJerk.std...Y"                     
	[32] "timeBodyGyroscopeJerk.std...Z"                     
	[33] "timeBodyAccelerometerMagnitude.mean.."             
	[34] "timeBodyAccelerometerMagnitude.std.."              
	[35] "timeGravityAccelerometerMagnitude.mean.."          
	[36] "timeGravityAccelerometerMagnitude.std.."           
	[37] "timeBodyAccelerometerJerkMagnitude.mean.."         
	[38] "timeBodyAccelerometerJerkMagnitude.std.."          
	[39] "timeBodyGyroscopeMagnitude.mean.."                 
	[40] "timeBodyGyroscopeMagnitude.std.."                  
	[41] "timeBodyGyroscopeJerkMagnitude.mean.."             
	[42] "timeBodyGyroscopeJerkMagnitude.std.."              
	[43] "frequencyBodyAccelerometer.mean...X"               
	[44] "frequencyBodyAccelerometer.mean...Y"               
	[45] "frequencyBodyAccelerometer.mean...Z"               
	[46] "frequencyBodyAccelerometer.std...X"                
	[47] "frequencyBodyAccelerometer.std...Y"                
	[48] "frequencyBodyAccelerometer.std...Z"                
	[49] "frequencyBodyAccelerometerJerk.mean...X"           
	[50] "frequencyBodyAccelerometerJerk.mean...Y"           
	[51] "frequencyBodyAccelerometerJerk.mean...Z"           
	[52] "frequencyBodyAccelerometerJerk.std...X"            
	[53] "frequencyBodyAccelerometerJerk.std...Y"            
	[54] "frequencyBodyAccelerometerJerk.std...Z"            
	[55] "frequencyBodyGyroscope.mean...X"                   
	[56] "frequencyBodyGyroscope.mean...Y"                   
	[57] "frequencyBodyGyroscope.mean...Z"                   
	[58] "frequencyBodyGyroscope.std...X"                    
	[59] "frequencyBodyGyroscope.std...Y"                    
	[60] "frequencyBodyGyroscope.std...Z"                    
	[61] "frequencyBodyAccelerometerMagnitude.mean.."        
	[62] "frequencyBodyAccelerometerMagnitude.std.."         
	[63] "frequencyBodyBodyAccelerometerJerkMagnitude.mean.."
	[64] "frequencyBodyBodyAccelerometerJerkMagnitude.std.." 
	[65] "frequencyBodyBodyGyroscopeMagnitude.mean.."        
	[66] "frequencyBodyBodyGyroscopeMagnitude.std.."         
	[67] "frequencyBodyBodyGyroscopeJerkMagnitude.mean.."    
	[68] "frequencyBodyBodyGyroscopeJerkMagnitude.std.."
		
		