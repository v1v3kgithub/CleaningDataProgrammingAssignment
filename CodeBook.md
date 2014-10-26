#### Steps in reading raw data 
1. Read the static data i.e List of Features and Activity Data
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
2. Define a function called create_measurement_data for reading the traiding data and creating a data.frame

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
3. Using the function (`create_measurement_data`) defined above read the `training_data` and `test_data` data

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
4. 

#### Reading Generated data into R
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

