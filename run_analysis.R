## We will use the data table package, so if not loaded, you must first read

## library("data.table", lib.loc="~/R/win-library/3.1")

## and in principle also may have "plyr"

## library("plyr", lib.loc="~/R/win-library/3.1")

## Read data
## read the data from the two directories, maintaining the structure archive

DTx_train <- read.table("./train/X_train.txt", header = FALSE, dec=".")
DTy_train <- read.table("./train/y_train.txt", header = FALSE)
DTs_train <- read.table("./train/subject_train.txt", header = FALSE)

DTx_test <- read.table("./test/X_test.txt", header = FALSE, dec=".")
DTy_test <- read.table("./test/y_test.txt", header = FALSE)
DTs_test <- read.table("./test/subject_test.txt", header = FALSE)

## Files activities
colnames(DTy_test)<-"id_act"
colnames(DTy_train)<-"id_act"


## To assign names to variables, keep the original of the file "features.txt"
features <- read.table("features.txt", header = FALSE)
colnames(features)<-c("id_fe","feature")

## We are suitable names for variables R
features$name_feature<-make.names(features[,2])
features$name_feature<-gsub("...", ".", features$name_feature,  fixed = TRUE)

## and assign to the two tables "train" and text "
colnames(DTx_train)<-features$name_feature
colnames(DTx_test)<-features$name_feature

## Description of activities
activity <- read.table("activity_labels.txt", header = FALSE)
colnames(activity)<-c("id_act","Activity")

## We add a "file" column to keep the file which the data come, maybe in this study are not required, but it seems useful.
DTx_test$file <- "test"
DTx_train$file <- "train"

## We add to the coded activities the description 
DTt_act_test<-merge(DTy_test,activity)
DTt_act_train<-merge(DTy_train,activity)

## and code of subjects
DTx_train$Subject <- DTs_train$V1
DTx_test$Subject <- DTs_test$V1

## We add to data files the activities
DTx_train$id_act <- DTt_act_train$id_act
DTx_train$Activity <- DTt_act_train$Activity
DTx_test$id_act <- DTt_act_test$id_act
DTx_test$Activity <- DTt_act_test$Activity

## We create a global table with two files
DTtotal <- rbind(DTx_train,DTx_test)


## We free space
rm(DTs_test)
rm(DTs_train)
rm(DTx_test)
rm(DTx_train)
rm(DTy_test)
rm(DTy_train)
rm(DTt_act_test)
rm(DTt_act_train)
## rm(activity)
## rm(features)

## saveRDS(DTtotal, "DTtotal.rds")

## DTtotal <- readRDS("DTtotal.rds")

## We choose the desired variables "Mean ()" and "std ()" with grep
f_mean <-features[grep("mean()",features[,2], fixed = TRUE),]
f_std <-features[grep("std()",features[,2], fixed = TRUE),]
f_mean_std <- rbind(f_mean,f_std)
f_mean_std_or<-f_mean_std[order(f_mean_std$id_fe),]

## We choose the variables
columns <- as.character(f_mean_std_or[,3])
columns <- c(c("Subject","Activity"),columns,c("file"))

## Create the table with selected columns requested
DTtidy1_project<- DTtotal[,columns]

## And we finished the first part of the project, to the point 4 We write the table to a file
write.table(DTtidy1_project,"DTtidy1_project.txt",row.names = FALSE)

## saveRDS(DTtidy1_project, "DTtidy1_project.rds")

## DTtidy1_project <- readRDS("DTtidy1_project.rds")

## For paragraph 5, you can use the function "by ()". 
## DTtidy2_project<-by(DTtidy1_project[,3:68],list(DTtidy1_project$Subject,DTtidy1_project$Activity),colMeans)

## Pero optamos hacerlo con la funcion tapply ya que presenta el resultado en forma de tabla, 
## aunque hay que hacerlo variable por variable

## We calculate the average for the first variable, according to subject and activity. 
cc<-tapply(DTtotal[,1],list(DTtotal$Subject,DTtotal$Activity),mean)

## results in a table in which rows are subjects, and the columns activities
## For that we rewrite the table with the first two columns, subject and activity, and third the average of the variable
c1 = cbind(rownames(cc),colnames(cc)[1],cc[,1])
c2 = cbind(rownames(cc),colnames(cc)[2],cc[,2])
c3 = cbind(rownames(cc),colnames(cc)[3],cc[,3])
c4 = cbind(rownames(cc),colnames(cc)[4],cc[,4])
c5 = cbind(rownames(cc),colnames(cc)[5],cc[,5])
c6 = cbind(rownames(cc),colnames(cc)[6],cc[,6])

## We unite in a final table
DTtidy2_project<-rbind(c1,c2,c3,c4,c5,c6)

## Repeat the process for the other variables
for (i in 2:561) {
  cc<-tapply(DTtotal[,i],list(DTtotal$Subject,DTtotal$Activity),mean)
  c1 = cbind(rownames(cc),colnames(cc)[1],cc[,1])
  c2 = cbind(rownames(cc),colnames(cc)[2],cc[,2])
  c3 = cbind(rownames(cc),colnames(cc)[3],cc[,3])
  c4 = cbind(rownames(cc),colnames(cc)[4],cc[,4])
  c5 = cbind(rownames(cc),colnames(cc)[5],cc[,5])
  c6 = cbind(rownames(cc),colnames(cc)[6],cc[,6])
  cc<-rbind(c1,c2,c3,c4,c5,c6)
  DTtidy2_project<-cbind(DTtidy2_project,cc[,3])
}

## And the name is assigned to the variables
colnames(DTtidy2_project)<-c("Subject","Activity",colnames(DTtotal)[1:561])

## And we finished the point 5 We write the table to a file
write.table(DTtidy2_project,"DTtidy2_project.txt",row.names = FALSE)