activity_labels.txt <- "activity_labels.txt"
features.txt <- "features.txt"


#Reading Activity Labels
activity_labels <- read.delim(activity_labels.txt,sep="",header=F)
names(activity_labels) <- c("ActivityId","ActivityLabel")

#Reading Features
features <- read.delim(features.txt,sep="",header=F)
names(features) <- c("FeatureId","FeatureName")


create_measurement_data <- function(data_set_file.txt,data_lable_file.txt,subject_file.txt,features_df,activity_labels_df) {
  #Reading Data Set File data_set_file.txt
  data_set <- read.delim(data_set_file.txt,sep="",numerals=c("no.loss"),header = F)
  
  #Reading Actiivty Ids file data_lable_file.txt and setting the column name
  activity_ids <- read.delim(data_lable_file.txt,sep="",numerals=c("no.loss"),header = F)
  names(activity_ids) <- "ActivityId"
  
  #Reading Subject Ids File subject_file.txt and setting the column name
  subjects_ids <- read.delim(subject_file.txt,sep="",numerals=c("no.loss"),header = F)
  names(subjects_ids) <- "SubjectId"
  
  print("Setting the feature column headers to data set")
  #Setting the feature column headers to data set (Step 4)
  names(data_set) <- features[,2]
  
  print("Adding activity Ids and Subject Ids to data set")
  data_set_with_ids <- cbind(subjects_ids,activity_ids,data_set)
  
  print("Adding Activity Labels")
  # Step 3 adding the activity label and activity ids
  complete_data_set <- merge(activity_labels_df,data_set_with_ids,by.x="ActivityId",by.y="ActivityId",all=F)
  return(complete_data_set)
}

# ------------- Reading in the Trading Data ------------
X_train.txt <- "./train/X_train.txt"
Y_train.txt <- "./train/y_train.txt"
subject_train.txt <- "./train/subject_train.txt"

print("Reading the Training Data ")
training_data <- create_measurement_data(X_train.txt,Y_train.txt,subject_train.txt,features,activity_labels)
training_data$DataSet = "Training"

# ------------- Reading in the Test Data ------------
X_test.txt <- "./test/X_test.txt"
Y_test.txt <- "./test/y_test.txt"
subject_test.txt <- "./test/subject_test.txt"

print("Reading the Test Data ")
test_data <- create_measurement_data(X_test.txt,Y_test.txt,subject_test.txt,features,activity_labels)
test_data$DataSet = "Test"

# ------------ Merging the training data and the test data ---------
print("Combining Test and Training Data Set")
combined_data <- rbind(test_data,training_data)

# --------- Filtering columns and only including columns for mean() and std()
print("Retriving only measurements for mean and std")
library("dplyr")
data_step4 <- select(combined_data,ActivityId,ActivityLabel,SubjectId,DataSet,contains("mean()"),contains("std()"))

# --- Creating Tidy data 
tidy_data <- data_step4 %>% group_by(ActivityLabel,SubjectId) %>% summarise_each(funs(mean),contains("mean()"),contains("std()"))

# --- According to Tidy Data - Hadley Wickham -- Making the data narrow
library(reshape2)
narrow_tidy <- melt(tidy_data,id.vars=c("SubjectId","ActivityLabel"),value.name="Value",variable.name="MeasurementType")
write.table(narrow_tidy,file="./narrow_tidy_data.txt")
