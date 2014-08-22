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

With the structure organized in columns, where the first 2 are Subject and Activity and others maintain order and name of the file "features_info.txt". Only selected variables of course.

The description of the variables in this file is in "Codebook_DTtidy1_project.txt" which is a modification of the original file

 head(DTtidy1_project)
  Subject Activity tBodyAcc.mean.X tBodyAcc.mean.Y tBodyAcc.mean.Z tBodyAcc.std.X tBodyAcc.std.Y tBodyAcc.std.Z
1       1  WALKING       0.2885845     -0.02029417      -0.1329051     -0.9952786     -0.9831106     -0.9135264
2       1  WALKING       0.2784188     -0.01641057      -0.1235202     -0.9982453     -0.9753002     -0.9603220
3       1  WALKING       0.2796531     -0.01946716      -0.1134617     -0.9953796     -0.9671870     -0.9789440
4       1  WALKING       0.2791739     -0.02620065      -0.1232826     -0.9960915     -0.9834027     -0.9906751
5       1  WALKING       0.2766288     -0.01656965      -0.1153619     -0.9981386     -0.9808173     -0.9904816
6       1  WALKING       0.2771988     -0.01009785      -0.1051373     -0.9973350     -0.9904868     -0.9954200

2)
El segundo fichero creado "DTtidy2_project.txt" contiene los datos del paso 5.

Con la estructura organizada en columnas, donde las 2 primeras son Subject y Activity y las otras mantienen el orden y nombre del fichero "features_info.txt". En este caso en cada variable hay el valor medio calculado.

 head(DTtidy2_project[20:30,])
   Subject Activity tBodyAcc.mean.X     tBodyAcc.mean.Y       tBodyAcc.mean.Z      tBodyAcc.std.X       tBodyAcc.std.Y      
20 "20"    "LAYING" "0.268210689679487" "-0.0154394352991026" "-0.103432062417949" "-0.546535422961538" "-0.259011300096154"
21 "21"    "LAYING" NA                  NA                    NA                   NA                   NA                  
22 "22"    "LAYING" NA                  NA                    NA                   NA                   NA                  
23 "23"    "LAYING" NA                  NA                    NA                   NA                   NA                  
24 "24"    "LAYING" "0.276767046391076" "-0.0176822460103885" "-0.107914503687664" "-0.675459176298425" "-0.582490655185302"
25 "25"    "LAYING" NA                  NA                    NA                   NA                   NA                  
   tBodyAcc.std.Z       tBodyAcc.mad.X       tBodyAcc.mad.Y       tBodyAcc.mad.Z       tBodyAcc.max.X      
20 "-0.639730168647436" "-0.577688003894231" "-0.267632956884615" "-0.645089060551282" "-0.396517082508333"
21 NA                   NA                   NA                   NA                   NA                  
22 NA                   NA                   NA                   NA                   NA                  
23 NA                   NA                   NA                   NA                   NA                  
24 "-0.636497458900262" "-0.696740172598425" "-0.604195294863517" "-0.647960180979003" "-0.540884458170079"
25 NA                   NA                   NA                   NA                   NA                  

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
