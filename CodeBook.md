# Code Book

The following code book describes the variables, the data, and all transformations performed to clean up data in run_analysis.R

### Source Information

All original files can be found at the following link. For further information about data used see [README](README.md)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Transformation Steps

1. Load activity_labels and features files to be applied to data sets
2. Create vector to subset data for variables including "mean" and "std"
3. Load labels, subjects, and data files for both Test and Training data sets
4. Apply features to column names in Test and Training data sets
5. Apply label names to both Test Labels and Training Labels
6. Concatinate Test and Training data sets
7. Aggregate combined dataset on average record for each subject and each activity
8. Export clean data set to working directory as Tidy_Data.txt

### Tidy_Data Variables

Tidy_Data file that is exported in Step 8 of the transformation will contain the following new variables
- subject
- activity

As well as include all fields from the source data that include either "mean" or "std" in the field name
