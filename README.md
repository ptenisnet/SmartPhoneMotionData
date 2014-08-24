---
title: "README.md"
author: "siva"
date: "08/24/2014"
output: html_document
---

Data manipulation is done by invoking  the run_analysis function defined in run_analysis.R with the following signature.
```
run_analysis <- function(directory="UCI HAR Dataset", outfile="mean_observations.txt")
```

Where ```directory``` specifies the directory path relative to the current working directory where the input data is stored 
and ```outfile``` specifies the text file path relative to the current working directory to which the output of the function is written. The R script which invokes the run_analysis function must be run from current working directory and assumes the following structure under ```directory``` for the data repository.
  
```
./test
./test/Inertial Signals
./test/Inertial Signals/body_acc_x_test.txt
./test/Inertial Signals/total_acc_y_test.txt
./test/Inertial Signals/body_acc_y_test.txt
./test/Inertial Signals/total_acc_x_test.txt
./test/Inertial Signals/body_gyro_y_test.txt
./test/Inertial Signals/body_gyro_x_test.txt
./test/Inertial Signals/body_gyro_z_test.txt
./test/Inertial Signals/body_acc_z_test.txt
./test/Inertial Signals/total_acc_z_test.txt
./test/y_test.txt
./test/X_test.txt
./test/subject_test.txt

./train
./train/Inertial Signals
./train/Inertial Signals/total_acc_z_train.txt
./train/Inertial Signals/body_acc_y_train.txt
./train/Inertial Signals/body_gyro_x_train.txt
./train/Inertial Signals/body_gyro_y_train.txt
./train/Inertial Signals/total_acc_x_train.txt
./train/Inertial Signals/body_acc_z_train.txt
./train/Inertial Signals/body_gyro_z_train.txt
./train/Inertial Signals/total_acc_y_train.txt
./train/Inertial Signals/body_acc_x_train.txt
./train/subject_train.txt
./train/y_train.txt
./train/X_train.txt
./features_info.txt
./README.txt
./activity_labels.txt
./features.txt

```

The run_analysis script has an example invocation which calls the above function as listed below

```
run_analysis()
``` 
i.e.  accepting the default argument values.