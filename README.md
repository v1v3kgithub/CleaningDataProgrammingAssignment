Coursera: Programming Assignment for **Getting and Cleaning Data**
-------------------------------------------------------------------

##Main script
`run_analysis.R`

##Description
The above script should be execute from the same folder as the *UCI HAR Dataset* it doesnt require any parameters to run.
The script reads the raw data from the data set and create a narrow tidy data set file using `write.table` at the same folder.

File Name: `narrow_tidy_data.txt`

##Generated file: `narrow_tidy_data.txt`
The file contains mutiple records, based off *Hadley Wickham's Tidy Data paper* avaliable at (http://vita.had.co.nz/papers/tidy-data.pdf) 


In tidy data:

1. Each variable forms a column.
2. Each observation forms a row.
3. Each type of observational unit forms a table.

Similary each record in the file represnets (column names)

1. SubjectId : Identification of the Subject who performed the activity
2. ActivityLabel: The type of activity performed e.g. Walking, Laying etc.
3. Measurement Type: Type of measurement performed (see feature_info.txt for the description of measurements)
4. Value: The measurement value.


