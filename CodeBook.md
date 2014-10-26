

#### Steps in reading raw data 
##### Read the static data i.e List of Features and Activity Data
Here we create two variables features and activity_lables
```
> head(features)
  FeatureId       FeatureName
1         1 tBodyAcc-mean()-X
2         2 tBodyAcc-mean()-Y
3         3 tBodyAcc-mean()-Z
4         4  tBodyAcc-std()-X
5         5  tBodyAcc-std()-Y
6         6  tBodyAcc-std()-Z
> head(activity_labels)
  ActivityId      ActivityLabel
1          1            WALKING
2          2   WALKING_UPSTAIRS
3          3 WALKING_DOWNSTAIRS
4          4            SITTING
5          5           STANDING
6          6             LAYING
```
##### Define a function called create_measurement_data for reading the traiding data and creating a data.frame

```
create_measurement_data <- function(data_set_file.txt,
					data_lable_file.txt,
					subject_file.txt,
					features_df,
					activity_labels_df)
```
This function performs the following steps


  * Read the data_set_file, data_label_file, and subject id file
     e.g. for training data it would be the following 

	```
	X_train.txt <- "./train/X_train.txt"
	Y_train.txt <- "./train/y_train.txt"
	subject_train.txt <- "./train/subject_train.txt"
	```
	
  * Using the features and activity_lables read in step 1 (above) set valid measurement lables and merge with activity_lables to create either training/test data set with ActivityId, ActivityLable, Subject Id.

##### Using the function (`create_measurement_data`) defined above read the `training_data` and `test_data` data

The following data as read from the `training_data`

```
> head(training_data[1:4,1:6])
  ActivityId ActivityLabel SubjectId tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
1          1       WALKING         6         0.2983396       -0.01625510       -0.11852915
2          1       WALKING         6         0.3367657       -0.03933244       -0.12671856
3          1       WALKING         6         0.2180418       -0.01220807       -0.10018623
4          1       WALKING         6         0.2580600        0.01821096       -0.07260441
> 

```
##### Combine the `training_data` and `test_data` into a single data.frame called `combined_data`
##### Using the function dplyr:select function only select columns (features) with represent the `mean()` and `std()`
##### Calculate the mean of all the features select in the above step (variable `tidy_data`)
##### Following the White papaer Tidy Data by Hadley Wickham [http://vita.had.co.nz/papers/tidy-data.pdf] we make the tidy data narrow (variable `narrow_tidy`)

narrow_tidy data

  ```
    SubjectId ActivityLabel   MeasurementType     Value
1         1        LAYING tBodyAcc-mean()-X 0.2215982
2         2        LAYING tBodyAcc-mean()-X 0.2813734
3         3        LAYING tBodyAcc-mean()-X 0.2755169
  ```
##### Save the data to file `narrow_tidy_data.txt`

#### Reading Generated data back into R
Execute the following R script to load the generated data back into R session 
```
data <- read.table("./narrow_tidy_data.txt",header=TRUE)
```
In the above script the file narrow_tidy_data.txt is the generated file.

You can execute the following command to view the contents of the data
```
> head(data)
  SubjectId ActivityLabel   MeasurementType     Value
1         1        LAYING tBodyAcc-mean()-X 0.2215982
2         2        LAYING tBodyAcc-mean()-X 0.2813734
3         3        LAYING tBodyAcc-mean()-X 0.2755169
4         4        LAYING tBodyAcc-mean()-X 0.2635592
5         5        LAYING tBodyAcc-mean()-X 0.2783343
6         6        LAYING tBodyAcc-mean()-X 0.2486565
```
#### Feature Selection 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

A Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Finally for each of the above signals we calculate the mean of the signals as grouped by Activity Label and Subject Id

e.g. tBodyAcc-mean()-X Represents the Average (by Activity Label and Subject) of the Mean Body Acceleration along the X axis

```
  SubjectId ActivityLabel   MeasurementType     Value
1         1        LAYING tBodyAcc-mean()-X 0.2215982
2         2        LAYING tBodyAcc-mean()-X 0.2813734
```
Based off the above section of the generated tidy_data the value `0.2215982` represents the Average Mean Body Acceleration along the X axis (`tBodyAcc-mean()-X`)
