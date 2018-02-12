#Getting and Cleaning Data Project
This repository contains all the scripts and data files for the final poject of the Coursera "Getting and Cleaning Data" course, part of the data science Specialization from John Hopkins University.

The project was to download the data set available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and construct a tidy data set by merging the original test and training data sets, keeping only measurements on the mean and standard deviation of each measurement, matching activity codes with activity names, giving more descriptive names to variables, and finally, computing the mean on each column of the resulting data set to create a tidy data set named final.csv.

Files in the Repo:
1. README.md
2. Codebook.md: Contains a description of all the variables, the data and the transformations performed.
3. run_analysis.R: This is the script file used to create the two data sets.
4. final.csv: The tidy data set that is an output of our analysis.
