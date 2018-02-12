library(dplyr)
##########Part 1##########
###Column binding training data###
X_train<-read.table("./UCI HAR dataset/train/X_train.txt")
y_train<-read.table("./UCI HAR dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR dataset/train/subject_train.txt")
train<-cbind(subject_train,y_train,X_train)
###Column binding test data###
X_test<-read.table("./UCI HAR dataset/test/X_test.txt")
y_test<-read.table("./UCI HAR dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR dataset/test/subject_test.txt")
test<-cbind(subject_test,y_test,X_test)
###Combining training and test data###
total<-rbind(train, test)
###################

##########Part 2##########
###Name variables in total appropriately###
features<-read.table("./UCI HAR dataset/features.txt", stringsAsFactors = FALSE);
features<-features[,2]; #Keep only second column since first is just indices
names(total)[1]<-"subject";
names(total)[2]<-"activity";
names(total)[3:563]<-features
###Picking feature names that contain mean() or std()###
mean_sd<-logical(length=563);
mean_sd[1:2]<-TRUE
mean_sd[3:563]<-grepl("mean[()]|std[()]", features);
total<-total[,mean_sd];

#########Part 3##########
###Replacing activity codes with activity names###
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE);
total<-mutate(total, activity=activity_labels[activity, 2]);

#########Part 4##########
###Giving variables more descriptive names###
names(total)<-sub("^t", "time", names(total))
names(total)<-sub("^f", "frequency", names(total))
names(total)<-sub("X$", "X-axis", names(total))
names(total)<-sub("Y$", "Y-axis", names(total))
names(total)<-sub("Z$", "Z-axis", names(total))

#########Part 4##########
###Creating a tidy data set with the mean of each variable for each subject-activity pair###
summary<-total %>% group_by(subject,activity) %>% summarize_all(mean)
write.csv(summary, "final.csv")