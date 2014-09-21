run_analysis<-function() {

# Read in the data files
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")

# Stitch "training" dataset files together
training_dataset<-cbind(X_train,subject_train,Y_train)

# Stitch "test" dataset files together
test_dataset<-cbind(X_test,subject_test,Y_test)

# Stitch together the overall "training" and "test" data into a single dataset
entire_dataset<-rbind(training_dataset,test_dataset)

# Extract only those columns that measure mean and standard deviation
features<-read.table("./UCI HAR Dataset/features.txt")
index<-as.logical(grepl("mean",features$V2)+grepl("std",features$V2))
extracted_dataset<-entire_dataset[,index]
extracted_features<-features[index,]

# Read the activity labels
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")

# Create descriptive variable names for features and descriptive labels for activities
activities[,2]<-tolower(gsub("_","",activities[,2]))
extracted_features[,2]<-tolower(gsub("-","",extracted_features[,2]))

# Merge in descriptive variable names and activity names
names(extracted_dataset)<-c(extracted_features[,2],"subject","act_code")
names(activities)<-c("act_code","activity")
merged_data<-merge(extracted_dataset,activities)

# Tidy up the dataset into a table called "tidy_data"--ran out of time..didn't get to this step so this next statement is just to fill the gap in my code
tidy_data<-merged_data

# Use write.table to create the file called "tidy_data.txt"
write.table(tidy_data,"tidy_data.txt")
print("You should have a file called 'tidy_data.txt' in your working directory now")
print("Notwithstanding the file name, I ran out of time, so I wasn't able to do the tidying, e.g. step #5 of the assignment")
}