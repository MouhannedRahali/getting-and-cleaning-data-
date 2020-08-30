## reading data

## reading the test data

library(data.table)

Xtes <- read.table("UCI HAR Dataset/test/X_test.txt")
Ytes <- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

## reading the train data

Xtrai<- read.table("UCI HAR Dataset/train/X_train.txt")
Ytrai<- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <-read.table("UCI HAR Dataset/train/subject_train.txt")

## merging the train data and the test data into one dataset 

X <- rbind(Xtes,Xtrai)
Y <- rbind(Ytes,Ytrai)
Subject <- rbind(SubjectTrain,SubjectTest)

## reading the features

features <-read.table("UCI HAR Dataset/features.txt")

## getting features indeces using the regex methods

pos <- grep("mean\\(\\)|std\\(\\)", features[,2])
X <- X[,pos]

## reading activities

activity<-read.table("UCI HAR Dataset/activity_labels.txt")

Y[,1]<-activity[Y[,1],2]

##getting variables/columns names

column_name <- features[pos,2]

## labeling the data in a descriptive way

names(X) <- column_name 
names(Subject)<-"SubjectID"
names(Y)<-"Activity"

## binding the data into one cleaned dataset
CleanData<-cbind(Subject, Y, X)

## creating an independent tidy data set with the average of each variable for each activity and each subject

CleanData<-data.table(CleanData)
TidyData <- CleanData[, lapply(.SD, mean), by = 'SubjectID,Activity']
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
