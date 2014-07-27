CodeBook
Human Activity Recognition Using Smartphones Dataset
=================================================
This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.  

* The website where the data was obtained:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
The data for the project:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

* The run_analysis.R script performs the following steps to clean the data:   

 1. Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder. 
    Store files in *trainData*, *trainLabel* and *trainSubject* variables respectively.       

 2. Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder.
    Store files in *testData*, *testLabel* and *testsubject* variables respectively.  
 
 3. Concatenate *testData* to *trainData* to generate a data frame *joinData*;      
    concatenate *testLabel* to *trainLabel* to generate a data frame, *joinLabel*; 
    concatenate *testSubject* to *trainSubject* to generate a data frame, *joinSubject*.  
 
 4. Read the features.txt file from the "/data" folder.
    Store the data in a variable called *features*. 
    Only extract the measurements on the mean and standard deviation. 
    This results in a 66 indices list. 
    Get a subset of *joinData* with the 66 corresponding columns.  
    
 5. Clean the column names of the subset. 
    Remove the "()" and "-" symbols in the names
    Make the first letter of "mean" and "std" a capital letter "M" and "S" respectively. 
    
 6. Read the activity_labels.txt file from the "./data"" folder.
    Store the data in a variable called *activity*.  
    
 7. Clean the activity names in the second column of *activity*. 
    Make all names to lower cases (if the name has an underscore between letters,  remove the underscore and capitalize the letter after the underscore)
    
 8. Transform the values of *joinLabel* according to the *activity* data frame.
 
 9. Combine the *joinSubject*, *joinLabel* and *joinData* by column to get a new cleaned data        frame, *cleanedData*. 
    Name the first two columns, "subject" and "activity". 
    The "subject" column contains integers that range from 1 to 30 inclusive; 
    the "activity" column contains 6 kinds of activity names; 
    the last 66 columns contain measurements that range from -1 to 1 exclusive.  
    
 10. Write the *cleanedData* out to "merged_data.txt" file in current working directory. 
 
 11. Generate a second independent tidy data set with the average of each measurement of each activity and each subject. 30  subjects and 6  activities lead to a 180 combinations of the two. For each combination, calculate the mean of each measurement with the corresponding combination. After initializing the *result* data frame and performing the two for-loops, got a 180x68 data frame.
 
 12. Write the *result* out to "data_with_means.txt" file in current working directory. 
 
