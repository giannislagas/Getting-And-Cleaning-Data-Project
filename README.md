# Getting and Cleaning Data Project

This repository contains all the scripts and data files for the final poject of the Coursera "Getting and Cleaning Data" course, part of the data science Specialization from John Hopkins University.

The project was to download the data set available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and construct a tidy data set by merging the original test and training data sets, keeping only measurements on the mean and standard deviation of each measurement, matching activity codes with activity names, giving more descriptive names to variables, and finally, computing the mean on each column of the resulting data set to create a tidy data set named final.csv.

Files in the Repo:
1. README.md
2. Codebook.md: Contains a description of all the variables, the data and the transformations performed.
3. run_analysis.R: This is the script file used to create the final tidy data sets.

Here's a guide to how my script works:
1. The dplyr package is loaded using the library(dplyr)  command.
2. For the next commands, we assume the user has already downloaded the zip above and unzipped it in his/her working directory. We load the files we need to merge to variables with the same name as the files using the read.table function. The X_train file refers to measurements (columns) indexed by rows that referred to different window measurements. The subject_train file has for each window the id of the individual whose measurements were taken during that window, and the y_train had the code for the activity the individual was performing during that window. Thus, the three were column binded with resulting data frame whose first column consisted of subject id, second of activity id and rest of columns consisted of measurements for the window indexed by the row number. A similar analysis was performed using the test data set. Then the two were row binded with the training data set on top to produce a total data set.
2. Subsequently, the resulting data frame variables were named after the feature.txt file which is included in the original zip file at the beginning of the document, and the first two columns were also named appropriately. grepl was used to select only the columns were mean() or std() appeared, as we only cared for mean or standard deviations of each measurements, and the other columns (apart from subject/activity) were discarded.
3. Subsequently, activity codes were replaced by their proper names. For this, the activity_labels.txt files of the original zip above was read into a data frame in R with codes in first column labels in second, and it was subsetted into using the vector of codes from our previous data frame.
4. Next, variable names were given more descriptive names, by replacing "t" in the beginning of a name with "time", "f" with "frequency" and adding an "-axis" suffix after XYZ to denote axis.
5. Finally, to obtain the desired tidy data set, we grouped our data set by subject first then activity and we applied mean to each column of the grouped data frame using summarize all.
