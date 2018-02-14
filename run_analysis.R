library(dplyr)

##########Importing data into R and load them to variables##########
temp<-tempfile() #Create a temporary filepath to download the file
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, temp)
X_train<-read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
y_train<-read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
subject_train<-read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
X_test<-read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
y_test<-read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
subject_test<-read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
features<-read.table(unz(temp,"UCI HAR Dataset/features.txt"), stringsAsFactors = FALSE)
activity_labels<-read.table(unz(temp,"UCI HAR Dataset/activity_labels.txt"), stringsAsFactors = FALSE)
unlink(temp)

##########Part 1##########
###Column binding training/test data###
train<-cbind(subject_train,y_train,X_train)
test<-cbind(subject_test,y_test,X_test)
###Combining training and test data###
total<-rbind(train, test)
###################

##########Part 2##########
###Name variables in total appropriately###
features<-features[,2]; #Keep only second column since first is just indices
names(total)[1]<-"subject_id";
names(total)[2]<-"activity_name";
names(total)[3:563]<-features
###Picking feature names that contain mean() or std()###
mean_sd<-logical(length=563);
mean_sd[1:2]<-TRUE
mean_sd[3:563]<-grepl("mean[()]|std[()]", features);
total<-total[,mean_sd];

#########Part 3##########
###Replacing activity codes with activity names###
total<-mutate(total, activity_name=activity_labels[activity_name, 2]);

#########Part 4##########
###Giving variables more descriptive names###
names(total)<-tolower(names(total))
names(total)<-sub("\\(\\)", "", names(total))
names(total)<-gsub("-", "_", names(total))
names(total)<-sub("^t", "time_", names(total))
names(total)<-sub("^f", "frequency_", names(total))
names(total)<-sub("bodygyro", "angular_velocity_", names(total))
names(total)<-sub("acc", "_acceleration_", names(total))
names(total)<-gsub("__" , "_", names(total))
names(total)<-sub("bodybody", "body", names(total))
names(total)<-sub("bodyangular", "angular", names(total))
names(total)<-sub("jerkmag", "jerk_mag", names(total))

#########Part 4##########
###Creating a tidy data set with the mean of each variable for each subject-activity pair###
summary<-total %>% group_by(subject_id,activity_name) %>% summarize_all(mean)
write.table(summary, "final.txt", row.names = FALSE)