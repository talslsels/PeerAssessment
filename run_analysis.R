# First: Merges the training and the test sets to create one data set.

# setwd("c://GitHub/PeerAssessment/")
trainData <- read.table("c://GitHub/PeerAssessment/data/train/X_train.txt")
dim(trainData) 
head(trainData)

trainLabel <- read.table("c://GitHub/PeerAssessment/data/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("c://GitHub/PeerAssessment/data/train/subject_train.txt")

testData <- read.table("c://GitHub/PeerAssessment/data/test/X_test.txt")
dim(testData) 
testLabel <- read.table("c://GitHub/PeerAssessment/data/test/y_test.txt") 
table(testLabel) 

testSubject <- read.table("c://GitHub/PeerAssessment/data/test/subject_test.txt")
joinData <- rbind(trainData, testData)
dim(joinData) 

joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) 
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject)

# Second: Extracts only the measurements on the mean and standard 
# deviation for each measurement. 
features <- read.table("c://GitHub/PeerAssessment/data/features.txt")
dim(features)  

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices)

joinData <- joinData[, meanStdIndices]
dim(joinData) 
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) 
names(joinData) <- gsub("mean", "Mean", names(joinData)) 
names(joinData) <- gsub("std", "Std", names(joinData)) 
names(joinData) <- gsub("-", "", names(joinData))  

# Third Uses descriptive activity names to name the activities in 
# the data set
activity <- read.table("c://GitHub/PeerAssessment/data/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))

activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

# Fourth Appropriately labels the data set with descriptive activity 

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData) 
write.table(cleanedData, "merged_data.txt") 

# Five Creates a second, independent tidy data set with the average of 

subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6

columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)

colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
    for(j in 1:activityLen) {
        result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == cleanedData$subject
        bool2 <- activity[j, 2] == cleanedData$activity
        result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
        row <- row + 1
    }
}

write.table(result, "data_with_means.txt") 

