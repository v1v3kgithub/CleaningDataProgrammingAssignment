setwd("/home/vivek/Development/R/Coursera/CleaningDataProgrammingAssignment/")
activity_labels.txt <- "activity_labels.txt"
features.txt <- "features.txt"


print("Reading Activity Labels")
activity_labels <- read.delim(activity_labels.txt,sep="",header=F)
names(activity_labels) <- c("ActivityId","ActivityLabel")

print("Reading Features")
features <- read.delim(features.txt,sep="",header=F)
names(features) <- c("FeatureId","FeatureName")


create_measurement_data <- function(data_set_file.txt,data_lable_file.txt,subject_file.txt,features_df,activity_labels_df) {
  sprintf("Reading Data Set File %s",data_set_file.txt)
  data_set <- read.delim(data_set_file.txt,sep="",numerals=c("no.loss"),header = F)
  sprintf("Reading Actiivty Ids file %s",data_lable_file.txt)
  activity_ids <- read.delim(data_lable_file.txt,sep="",numerals=c("no.loss"),header = F)
  names(activity_ids) <- "ActivityId"
  
  sprintf("Reading Subject Ids File: %s",subject_file.txt)
  subjects_ids <- read.delim(subject_file.txt,sep="",numerals=c("no.loss"),header = F)
  names(subjects_ids) <- "SubjectId"
  
  print("Setting the feature column headers to data set")
  names(data_set) <- features[,2]
  
  print("Adding activity Ids and Subject Ids to data set")
  data_set_with_ids <- cbind(subjects_ids,activity_ids,data_set)
  
  print("Adding Activity Labels")
  complete_data_set <- merge(activity_labels_df,data_set_with_ids,by.x="ActivityId",by.y="ActivityId",all=F)
  return(complete_data_set)
}
X_train.txt <- "./train/X_train.txt"
Y_train.txt <- "./train/y_train.txt"
subject_train.txt <- "./train/subject_train.txt"

print("Reading the Training Data ")
training_data <- create_measurement_data(X_train.txt,Y_train.txt,subject_train.txt,features,activity_labels)
training_data$DataSet = "Training"
  
X_test.txt <- "./test/X_test.txt"
Y_test.txt <- "./test/y_test.txt"
subject_test.txt <- "./test/subject_test.txt"
print("Reading the Test Data ")
test_data <- create_measurement_data(X_test.txt,Y_test.txt,subject_test.txt,features,activity_labels)
test_data$DataSet = "Test"

print("Combining Test and Training Data Set")
combined_data <- rbind(test_data,training_data)
