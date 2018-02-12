#CODEBOOK

The original data sets can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

In the original experiment, 30 individuals wore a smartphone on their waist while performing various activities. The phone's sensors (gyroscope and accelerometer) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

The variables in the final.csv are as follows:
1. A prefix of time refers to time domain.
2. A prefix of frequency refers to frequency domain. This measurement is obtained from the corresponding time measurement by applying a FFT (Fast Fourrier Transform).
3. BodyAcc refers to the body acceleration component of the accelaration signal. The raw accelerometer signal was captured at a constant rate of 50Hz, then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. It was then then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
4. GravityAcc refers to the gravity acceleration component of the accelaration signal (see BodyAcc for details on how it was obtained).
5. BodyGyro refers to the angular velocity measured from the gyroscope signal, which was captured at a constant rate of 50Hz.
6. BodyAccJerk refers to the body acceleration jerk signal. This was obtained by deriving BodyAcc in time.
7. BodyGyroJerk refers to the angular velocity jerk signal. This was obtained by deriving BodyGyro in time.
8. A suffix of Mag refers to magnitude. Euclidean distance was used.
9. A suffix of X-axis, Y-axis or Z-axis refers to the x,y or z-component of the corresponding measurement.
10. subject: a unique id referring to each individual in the experiment. Range is 1-30.
11. activity: The activity the subject was performing when measurements were taken.
12. mean(): refers to the average of all measurements for the activity/individual pair that corresponds to that row.
13. std(): refers to the average over all windows of the standard deviation over measurements for each reading in the window for the activity/individual pair that corresponds to that row.

Thus, for example timeBodyAcc-mean()-X-axis would refer to the average x-coordinate of the measurement of the Body Acceleration component of the accelerometer for each individual/activity pair.

To obtain the final.csv data set the following transformations were performed:
1. In the train folder of the original data set, the X_train file referred to measurements (columns) indexed by rows that referred to different window measurements. The subject_train file had for each window the id of the individual whose measurements were taken during that window, and the y_train had the code for the activity the individual was performing during that window. Thus, the three were column binded with resulting data frame whose first column consisted of subject id, second of activity id and rest of columns consisted of measurements for the window indexed by the row number. A similar analysis was performed using the test data set. Then the two were row binded with the training data set on top to produce a total data set.
2. Subsequently, the resulting data frame variables were named after the feature.txt file which is included in the original zip file at the beginning of the document, and the first two columns were also named appropriately. grepl was used to select only the columns were mean() or std() appeared, as we only cared for mean or standard deviations of each measurements, and the other columns (apart from subject/activity) were discarded.
3. Subsequently, activity codes were replaced by their proper names. For this, the activity_labels.txt files of the original zip above was read into a data frame in R with codes in first column labels in second, and it was subsetted into using the vector of codes from our previous data frame.
4. Next, variable names were given more descriptive names, by replacing "t" in the beginning of a name with "time", "f" with "frequency" and adding an "-axis" suffix after XYZ to denote axis.
5. Finally, to obtain the desired tidy data set, we grouped our data set by subject first then activity and we applied mean to each column of the grouped data frame using summarize all.

