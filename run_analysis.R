#Start of part 1

if ( !file.exists("./UCI HAR Dataset") ) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, "./project.zip")
  unzip("./project.zip", exdir = ".")
}

testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

testLabel <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainLabel <- read.table("./UCI HAR Dataset/train/y_train.txt")

testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

dataTotal <- rbind(trainData, testData)
labelTotal <- rbind(trainLabel, testLabel)
subjectTotal <- rbind(trainSubject, testSubject)
mergedDT <- cbind(cbind(subjectTotal, labelTotal), dataTotal)

#End of Part 1

#Start of Part2

featuresDT <- read.table("./UCI HAR Dataset/features.txt")
setnames(mergedDT, c(3:563), as.character(featuresDT$V2))
setnames(mergedDT, c(1,2), c("subject", "activity"))

keepColumnsIndex <- grep("mean\\(\\)|std\\(\\)", names(mergedDT))
keepColumnsIndex <- c(1,2,keepColumnsIndex)
mergedDT <- mergedDT[, keepColumnsIndex]

#End of Part2

#Start of Part3

activityNames <- read.table("./UCI HAR Dataset/activity_labels.txt")
mergedDT[,2] <- activityNames[mergedDT[,2], 2]

#End of Part3

#Start of Part4

names(mergedDT) <- gsub("^t", "time", names(mergedDT))
names(mergedDT) <- gsub("^f", "frequency", names(mergedDT))
names(mergedDT) <- gsub("Acc", "Accelerometer", names(mergedDT))
names(mergedDT) <- gsub("Gyro", "Gyroscope", names(mergedDT))
names(mergedDT) <- gsub("Mag", "Magnitude", names(mergedDT))

#End of Part4

#Start of Part5

averageDT <- aggregate(mergedDT[, 3:ncol(mergedDT)], by = list(mergedDT$activity, mergedDT$subject), mean)
names(averageDT)[1] <- "activity"
names(averageDT)[2] <- "subject"
write.table(averageDT, "./tidyDataAverageForSubjectAndActivity.txt")

#End of Part5