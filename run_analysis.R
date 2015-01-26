
x_train <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
x_test <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")

x <- data.frame(x_train)
x[(nrow(x)+1):(nrow(x)+nrow(x_test)),] <- x_test[1:nrow(x_test),]

y_train <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
y_test <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

y <- data.frame(y_train)
y[(nrow(y)+1):(nrow(y)+nrow(y_test)),] <- y_test[1:nrow(y_test),]

subject_train <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

subject <- data.frame(subject_train)
subject[(nrow(subject)+1):(nrow(subject)+nrow(subject_test)),] <- subject_test[1:nrow(subject_test),]

activity_labels <- read.table(file = "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")


features <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//features.txt")
a <- vector(features$V2)
a <- as.character(features[,2])

features <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset//features.txt", colClasses = "character")
a <- features$V2

b <- regexec(pattern = "mean", a)
c <- as.numeric(b)

x2 <- x[,c>0]


b <- regexec("mean\\(\\)|std\\(\\)", a)
c <- as.numeric(b)

activity_column <- factor(labels, levels = activity_labels$V1, labels = activity_labels$V2)

x2$activity_column <- activity_column

x2$subject <- subject

