# Getting and Cleaning Data Course Project
The following ordered list describes the functionality of the **run_analysis.R** script, which is a part of the final project of the course **Getting and Cleaning Data** offered via **Coursera**.

1. **Data preparation**  
In order to make the script more reusable, the script downloads the data from the source (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), unzips the downloaded archive and then transforms the training set and the test set into separate data frames.
   
2. **Merge of the training set and the test set**  
In the second step, the script merges the training set and the test set and adds corresponding labels to the variables using the labels provided with the data.

3. **Extraction of the measurements on the mean and standard deviation for each measurement**  
In the third step, the script filters the variables which are related to a mean or a standard deviation of the measurement.
   
4. **Transformation of the activity IDs**  
In the fourth step, the script replaces IDs of each activity with a corresponding label using the labels provided with the data.

5. **Transformation of the variable names**  
In the fifth step, the script cleans the variable names (labels).

6. **Tidy dataset creation**  
In the last step, the script creates a tidy dataset with the following specification:
Independent tidy data set with the average of each variable for each activity and each subject.
