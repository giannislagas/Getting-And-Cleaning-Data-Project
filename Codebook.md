# CODEBOOK

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
