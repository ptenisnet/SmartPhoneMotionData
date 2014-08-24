run_analysis()
run_analysis <- function(directory="UCI HAR Dataset", outfile="mean_observations.txt") {
  #load all libraries
  library(stringr)
  
  # Read in the test and train observations
  test_x <- read.csv(paste(directory, "/test/X_test.txt", sep=""), sep="", header=FALSE)
  train_x <- read.csv(paste(directory, "/train/X_train.txt", sep=""), sep="", header=FALSE)
  # test and train activity lists
  test_y <- read.csv(paste(directory, "/test/y_test.txt", sep=""), sep="", header=FALSE)
  train_y <- read.csv( paste(directory, "/train/y_train.txt", sep=""), sep="", header=FALSE)
  #test and train subject lists
  test_sub <- read.csv(paste(directory, "/test/subject_test.txt", sep=""), sep="", header=FALSE)
  train_sub <- read.csv(paste(directory, "/train/subject_train.txt", sep=""), sep="", header=FALSE)
  #activity map - maps activity codes to explicit activity names
  activity_map <- read.table(paste(directory,"/activity_labels.txt", sep=""), sep="", header=FALSE)
  #feature names
  raw_feature_names <- read.table(paste(directory, "/features.txt", sep=""), header=FALSE, sep="")
  

  #Convert activity codes to activity names

  test_act <- apply(test_y, 1, function (x, act_map) act_map[x, "V2"], activity_map )
  train_act <- apply(train_y, 1, function (x, act_map) act_map[x, "V2"], activity_map )
  
  feat_names <- c("Subject", "Activity", lapply(raw_feature_names$V2, function (x) str_replace_all(x, "[\\(,\\)]", "")))
  
  
  
  
  #add activity names
  test_with_activity <- cbind(test_act, test_x)
  train_with_activity <- cbind(train_act, train_x)
  
  #Add subject ids
  test_act_sub <- cbind(test_sub,test_with_activity)

  train_act_sub <- cbind(train_sub, train_with_activity)

  
  #Change column names
  names(test_act_sub) <- feat_names  
  names(train_act_sub) <- feat_names  
  
  #finally we combine test and training data
  all_act_sub <- rbind(test_act_sub, train_act_sub)
  #names(all_act_sub) <- feat_names
  
  #all the features we want saved.  Only those with mean and std in their names
  mean_std_vars <- grep("mean|std", names(all_act_sub), value=TRUE)
  save_features <- c("Subject", "Activity", mean_std_vars)
  
  mean_std_vars_data <- all_act_sub[,save_features]
  #calculate mean of all data being saved
  agg_data <- aggregate(mean_std_vars_data[, 3:81], by=list(mean_std_vars_data$Subject, mean_std_vars_data$Activity), FUN="mean")
  names(agg_data)[1]="Subject"
  names(agg_data)[2]="Activity"
  #Output file is written to working directory
  write.table(agg_data, file=outfile, row.names=FALSE, col.names=TRUE, sep=" ", quote=FALSE)
}

