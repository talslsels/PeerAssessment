Human Activity Recognition Using Smartphones Dataset
(Getting and Cleaning Data Course Project)
========================================
This file describes how run_analysis.R script works.

* 1st, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "data".

* 2nd, use source("run_analysis.R") command in RStudio. 

* 3rd, two output files are generated in the current working directory:
  - merged_data.txt (7.9 Mb): contains a data frame called cleanedData with 10299*68 dimension.
  - data_with_means.txt (220 Kb): contains a data frame called result with 180*68 dimension.
  
* 4th, use data <- read.table("data_with_means.txt") command in RStudio to read the file. 