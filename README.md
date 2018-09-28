Coursera Getting and cleaing data project:
============================================
1. Repository content:
----------------------
- #### `tidy_data.csv` 
##### the required data set.
- #### `Code book.md`  
##### details on the data set and all variables.
- #### `Readme.md` 
#### details on the original data collection and the files in the repository.
- #### `run_analysis.R` 
#### the R script file containing who the data was transformed to tidy_data.csv

2. The study:
-------------
### More on the study and data sources can be found in [Click here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
### Data Set Information:

##### The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##### The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

#### Check the README.txt file for further details about this dataset. 

##### A video of the experiment including an example of the 6 recorded activities with one of the participants can be seen in the following link: [Click here](http://www.youtube.com/watch?v=XOEN9W05_4A)

### Attribute Information:

#### For each record in the dataset it is provided: 
- ##### Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- ##### Triaxial Angular velocity from the gyroscope. 
- ##### A 561-feature vector with time and frequency domain variables. 
- ##### Its activity label. 
- ##### An identifier of the subject who carried out the experiment.

3. Data transformation:
-----------------------
- ##### Downloaded the dataset zip file.
- ##### Unzipped the file
- ##### Read the Readme.md file with provided with the data.
- ##### Read the activity and features file of the study.
- ##### Filered the features to contains only columns names that has ( mean and std).
- ##### Read the tables for both training and test folders.
- ##### Changed the activity values from `y_test.txt` and `y.train.txt` to the activity names.
- ##### Selected the required columns with the help of features table.
- ##### Cleaned the columns names from features file (removed spaces and others described fully in the run_analysis.R)
- ##### Created two tables for test and train with subjects and activity names. 
- ##### Combined the tables for training and testing.
- ##### Grouped the resulting table by subject first then activity.
- ##### Calculated means of all variables.
- ##### Exported a tidy data file as `tidy_data.csv`



