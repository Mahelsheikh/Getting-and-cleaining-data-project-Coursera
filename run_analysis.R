## Getting the dataset files url
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("Course3")) { dir.create("Course3")}
## set a new workspace to avoid any confusion
setwd("./Course3")
## installed packages that will help in the process of getting and cleaning the data
library(dplyr)
library(tidyr)
## Downloaded the file and created a download date
download.file(fileurl,destfile= "Dataset.zip", method = "curl")
DatasetDatedwonload <- date()
## Unziped the downloaded file
unzip("Dataset.zip",list = FALSE)
## read the README.txt file to understand the data and how it was created
View(read.delim("./UCI HAR Dataset/README.txt"))
## Read the features table data with read.table
featurestbl<-read.table("./UCI HAR Dataset/features.txt")
## Getting the names of the columns fixed properly (replaced "t" with "time" , 
## "f" with "frequency" , "-" with blank repalced typos , removed "\\()"
## ,changed all letters to lower case letters and replaced all blansk with "_")
requiredfeatures<-featurestbl %>% filter(grepl(".*mean*.|.*std*.",featurestbl$V2))
requiredfeaturesnames<-requiredfeatures$V2
requiredfeaturesnames<-as.character(requiredfeaturesnames)
requiredfeaturesnames<-gsub("^t","time",requiredfeaturesnames)
requiredfeaturesnames<-gsub("^f","frequency",requiredfeaturesnames)
requiredfeaturesnames<-gsub("-"," ",requiredfeaturesnames)
requiredfeaturesnames<-gsub("bodybody","body",requiredfeaturesnames)
requiredfeaturesnames<-gsub("\\()","",requiredfeaturesnames)
requiredfeaturesnames<-gsub(" ","_",requiredfeaturesnames)
requiredfeaturesnames<-tolower(requiredfeaturesnames)
##got the columns numbers of the required columns from the requiredfeatures table 
colrange<-requiredfeatures$V1
## set a path for test and train data
testpath<-"./UCI HAR Dataset/test"
trainpath<-"./UCI HAR Dataset/train"
## reading test tables (subject_test.txt,y_test.txt,X_test.txt)
subtest<-read.table(file.path(testpath, "subject_test.txt"))
ytest<-read.table(file.path(testpath, "y_test.txt"))
Xtest<-read.table(file.path(testpath, "X_test.txt"))
## selected the columns required by using colrange from X_test.txt table
Xtest<-select(Xtest,colrange)
## reading train tables (subject_train.txt,y_train.txt,X_train.txt)
subtrain<-read.table(file.path(trainpath, "subject_train.txt"))
Xtrain<-read.table(file.path(trainpath, "X_train.txt"))
ytrain<-read.table(file.path(trainpath, "y_train.txt"))
## selected the columns required by using colrange from X_train.txt table
Xtrain<-select(Xtrain,colrange)
## reading activity table
activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
## replaced all activity ID with the proper activity names for ytest
ytestname<-ytest
ytestname[] <- activity$V2[match(unlist(ytest), activity$V1)]
## cominded columns and created a new table called testtbl which contains 
## subject,activity and required variables ( mean and std) for test data
testtbl<-cbind(subtest,ytestname,Xtest)
## replaced all activity ID with the proper activity names for ytest
ytrainname<-ytrain
ytrainname[] <- activity$V2[match(unlist(ytrain), activity$V1)]
## cominded columns and created a new table called testtbl which contains 
## subject,activity and required variables ( mean and std) for train data
traintbl<-cbind(subtrain,ytrainname,Xtrain)
## combinded testtbl and traintbl with rbind to make one table called combinedtbl
combinedtbl<-rbind(testtbl,traintbl)
## renamed all columns subject and activity and all the required featurese names
## that contains (mean and std)
colnames(combinedtbl)<-c("subject","activity",requiredfeaturesnames)
## removed unnessecary data from workspace
rm("activity","colrange","featurestbl","requiredfeatures","requiredfeaturesnames"
   ,"subtest","subtrain","testpath", "testtbl","trainpath","traintbl","Xtest",
   "Xtrain","ytest","ytestname","ytrain","ytrainname")
## Created a new table called groupedtbl in which all data is grouped by subject 
## first then activity then summarised all other variables getting the mean for 
## each subject and each activity for each subject
groupedtbl<- combinedtbl %>% group_by(subject,activity) %>% summarise_all(funs(mean))
## write the tidy data in to tidy_data.txt 
write.table(groupedtbl,"tidy_data.txt",quote = FALSE,row.names = FALSE)
