# Extract data from features.txt

features<-fread("features.txt")
names(features) <- c("featureId","featureDesc")
for (i in seq(length(features$featureId))) {
  features$measureType[i] <- unlist(strsplit(features$featureDesc[i], split="-"))[1]
  features$measureFunction[i] <- unlist(strsplit(features$featureDesc[i], split="-"))[2]
  features$measureInterval[i] <- unlist(strsplit(features$featureDesc[i], split="-"))[3]
}

# Extract data from activity_labels.txt

activitiesInfo<-read.table("activity_labels.txt")
names(activitiesInfo) <- c("activityId", "activityDesc")

# Extract data from X_test.txt and X_train.txt and merge them

test_measures <- read.table("test/X_test.txt")
train_measures <- read.table("train/X_train.txt") 
measure_data <- rbind(test_measures, train_measures)

# Set feature names in measure_data table

names(measure_data) <-  features$featureDesc

# Extract only mean and sd data from measurements

logicalV <- features$measureFunction=="mean()" | features$measureFunction=="std()"
selected_measure_data <- measure_data[, which(logicalV)]

# Extract data from subject_test.txt and subject_train.txt and merge them

test_subjects <- read.table("test/subject_test.txt")
train_subjects <- read.table("train/subject_train.txt")
subjects <- rbind(test_subjects,train_subjects)
names(subjects) <- "subject"

# Extract data from y_test.txt and y_train.txt and merge them

test_activities <- read.table("test/y_test.txt")
train_activities <- read.table("train/y_train.txt")
activities <- rbind(test_activities, train_activities)
names(activities) <- "activity"

# Set activity names on activities table

activities[, 1] <- activitiesInfo[activities[, 1], 2]

# Merge all data into one table

all_data <- cbind(subjects, activities, selected_measure_data)

# Compute averages for each subject and put them in an independent data set
# Export data set to file named averages_data.txt

averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 3:length(x)]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)
