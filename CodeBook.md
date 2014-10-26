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

