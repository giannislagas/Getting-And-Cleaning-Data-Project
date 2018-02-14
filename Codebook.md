# CODEBOOK

The original data sets can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

From the description in the README.md file in that directory: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. They then partitioned the obtained dataset randomly into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The output file final.txt contains variables in columns. Variable names are all lower case and separated by a "_" in lieu of space. The names are concatenations of the following words:
1. A prefix of time refers to time domain. A prefix of frequency refers to frequency domain. Frequency domain measurements are obtained from the corresponding time domain frequencies via a Fast Fourrier Transform.
2. body_acceleration refers to the body acceleration component of the accelaration signal. gravity_acceleration refers to the gravity acceleration component of the accelaration signal, and angular_velocity refers to the angular velocity measured from the gyroscope signal.
3. jerk (optional) if present in the name it indicates the jerk signal obtained by deriving with respect to time.
4. mag refers to magnitude. Euclidean distance was used.
5. mean: refers to the average of all measurements for the activity/individual pair that corresponds to that row.
6. std: refers to the average over all windows of the standard deviation over measurements for each reading in the window for the activity/individual pair that corresponds to that row.
7. (Optional)A suffix of x,y,z refers to the x,y or z-component of the corresponding measurement (for vector measurements only; doesn't apply to mag).

Thus, for example time_body_acceleration_mean_x would refer to the average x-coordinate of the measurement of the Body Acceleration component of the accelerometer for each individual/activity pair.

In addition, there are two other variables:

10. subject_id: a unique id referring to each individual in the experiment. Range is 1-30.
11. activity_name: The activity the subject was performing when measurements were taken (walking, walking upstairs, walking downstairs, sitting, standing, laying).

For details on how the script works, see the README.md file.
