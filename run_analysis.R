# The assignment asks for the following:
# You should create one R script called run_analysis.R that does the following: 

# 1. Merges the training and the test sets to create one data set. [CHECKED]
# 2. Extracts only the measurements on the mean and standard deviation for each
#    measurement.[CHECKED]
# 3. Uses descriptive activity names to name the activities in the data set [CHECKED]
# 4. Appropriately labels the data set with descriptive variable names. [CHECKED]
# 5. From the data set in step 4, creates a second, independent tidy data set [CHECKED]
#    with the average of each variable for each activity and each subject.

# Some notes on the original data: y_test.txt and y_train.txt are tables that
# refer to activity_labels.txt of each obs in train.txt and test.txt. 
# subject_test.txt and subject_train.txt carry the subject numbers for each obs
# in test.txt and train.txt

# First, let's download the data from the interwebs.

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest<-"./getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, dest, mode = "wb")
unzip(dest)

# Now let's load the data into R.

train_data<-read.table("./UCI HAR Dataset/train/X_train.txt")
test_data<-read.table("./UCI HAR Dataset/test/X_test.txt")
act_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
act_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
act_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
var_names<-read.table("./UCI HAR Dataset/features.txt")

# ... and turn the data from tables into vectors of the right class.

act_labels<-as.character(act_labels$V2)
act_train<-as.factor(act_train$V1)
act_test<-as.factor(act_test$V1)
sub_train<-as.integer(sub_train$V1)
sub_test<-as.integer(sub_test$V1)
var_names<- as.character(var_names$V2)

# We set the levels on the activity objects so they are words instead of numbers
# This takes care of step 3 ahead of time. 

levels(act_train)<-act_labels
levels(act_test)<-act_labels

# Step 1. The following code pastes everything together into one data frame:

# First we paste subject and activity records to the train and test data sets.

train_data<-cbind(sub_train, act_train, train_data)
test_data<-cbind(sub_test, act_test, test_data)

# Then we add variable names to the train and test data frames. We need to do
# this first so rbind() knows how to paste the data together.

var_names<- c("subject","activity", var_names)
colnames(train_data)<-var_names
colnames(test_data)<-var_names

# Finally, we paste those two together.

data<- rbind(train_data, test_data)

# On to step 2! Extract names with "mean" or "std" through regular expressions.

mean_n_std<-grep("mean()|std()", var_names)

# OBS! Alternatively the user can modify this line to get any type of variable
# she wants. For example:
# mean_n_std<-grep("mean()|std()|meanFreq()", var_names)
# Refer to features_info.text to learn more about the variables available in the
# original data set.

subset_data<-data[,c(1:2, mean_n_std)]

# Step 4. We need to change the ugly labels in the data to something more 
# descriptive.

new_names<-colnames(subset_data)

for (i in 1:length(new_names)){
  new_names[i] = gsub("\\()","",new_names[i])
  new_names[i] = gsub("-X","X-axis",new_names[i])
  new_names[i] = gsub("-Y","Y-axis",new_names[i])
  new_names[i] = gsub("-Z","Z-axis",new_names[i])
  new_names[i] = gsub("-std","Standard Deviation ",new_names[i])
  new_names[i] = gsub("-mean","Mean ",new_names[i])
  new_names[i] = gsub("^(t)","Time Series ",new_names[i])
  new_names[i] = gsub("^(f)","Frequency ",new_names[i])
  new_names[i] = gsub("Gravity","Gravity ",new_names[i])
  new_names[i] = gsub("Body","Body ",new_names[i])
  new_names[i] = gsub("Acc","Accelerometer ",new_names[i])
  new_names[i] = gsub("Jerk","Jerk ",new_names[i])
  new_names[i] = gsub("Mag","Magnitude ",new_names[i])
  new_names[i] = gsub("Gyro","Gyroscope ",new_names[i])
}

colnames(subset_data)<-new_names

# Step 5. We need to create a new tidy data set with the averages of all 
# previous data by activity and subject.

library(reshape2)
library(dplyr)

data_melt<-melt(subset_data, id.vars = 1:2, measure.vars = 3:81)
data_cast<-dcast(data_melt, subject + activity ~ variable, mean)

tidy_data<-tbl_df(data_cast)
tidy_data<-arrange(tidy_data, subject, activity)

write.table(tidy_data, "./tidy_data.txt", row.names = FALSE)