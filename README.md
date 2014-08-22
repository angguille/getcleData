==================================================================
Human Activity Recognition Using Smartphones Dataset

==================================================================

Getting and Cleaning Data Course Project

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 




The project creates two files tidy data "DTtidy1_project.txt" covering the first 4 points of the project. 

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 


And a second file "DTtidy2_project.txt" Section 5.

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The R script is in the file "run_analysis.R" which is abundantly commented to describe its operation

To work we have the file in the working directory with the directory structure that is created when you unzip the data file, ie the directory must have the file 

- 'Features_info.txt': Shows information about the variables used on the feature vector. 

- 'Features.txt': List of all features. 

- 'Activity_labels.txt': the class labels Links With Their activity name. 

- 'Train / X_train.txt': Training set. 

- 'Train / y_train.txt': Training labels. 

- 'Train / subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'Test / X_test.txt': Test set. 

- 'Test / y_test.txt': Test labels.

- 'Test / subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Results:
1) The first file created "DTtidy1_project.txt" has the data selected in the first 4 steps. 

With the structure organized in columns, where the first 2 are Subject and Activity and others maintain order and name 
of the file "features_info.txt". Only selected variables of course.

The description of the variables in this file is in "Codebook_DTtidy1_project.txt" which is a modification of the original file

 head(DTtidy1_project)
  Subject Activity tBodyAcc.mean.X tBodyAcc.mean.Y tBodyAcc.mean.Z tBodyAcc.std.X tBodyAcc.std.Y tBodyAcc.std.Z
1       1  WALKING       0.2885845     -0.02029417      -0.1329051     -0.9952786     -0.9831106     -0.9135264
2       1  WALKING       0.2784188     -0.01641057      -0.1235202     -0.9982453     -0.9753002     -0.9603220

2)
The second file created "DTtidy2_project.txt 'contains data from step 5.

With the structure organized in columns, where the first 2 are Subject and Activity and others maintain order and name 
of the file "features_info.txt". In this case each variable there is the average value calculated.

 head(DTtidy2_project[20:30,])
   Subject Activity tBodyAcc.mean.X     tBodyAcc.mean.Y       tBodyAcc.mean.Z      tBodyAcc.std.X       tBodyAcc.std.Y      
20 "20"    "LAYING" "0.268210689679487" "-0.0154394352991026" "-0.103432062417949" "-0.546535422961538" "-0.259011300096154"
21 "21"    "LAYING" NA                  NA                    NA                   NA                   NA                  

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
