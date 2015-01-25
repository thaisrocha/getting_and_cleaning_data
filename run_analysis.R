# Merges the training and the test sets to create one data set
Xtrain <- read.table("./train/X_train.txt")
Xtest <- read.table("./test/X_test.txt")
# create X data set
X <- rbind(Xtrain, Xtest)

Ytrain <- read.table("train/y_train.txt")
Ytest <- read.table("test/y_test.txt")
# create Y data set
Y <- rbind(Ytrain, Ytest)

Strain <- read.table("./train/subject_train.txt")
Stest <- read.table("./test/subject_test.txt")
# create Subject data set
Subject <- rbind(Strain, Stest)

# Extracts only the measurements on the mean and standard deviation for each measurement

features <- read.table("./features.txt")
mean_std_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, mean_std_features]
names(X) <- features[mean_std_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# Uses descriptive activity names to name the activities in the data set

activities <- read.table("./activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# Appropriately labels the data set with descriptive variable names

names(Subject) <- "subject"
cleaned <- cbind(Subject, Y, X)
write.table(cleaned, "merged_clean_data.txt")

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
uniqueSubjects = unique(Subject)[,1]
numSubjects = length(unique(Subject)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (Subject in 1:numSubjects) {
    for (a in 1:numActivities) {
        result[row, 1] = uniqueSubjects[s]
        result[row, 2] = activities[a, 2]
        tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
} 
write.table(result, "data_average.txt", row.name=FALSE)