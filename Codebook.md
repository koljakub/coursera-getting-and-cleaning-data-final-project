# The code book
The code book describes the variables of the tidy dataset created by the run_analysis.R script.  
**Original data source:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Study design
>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.  

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).  

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  

The set of variables that were estimated from these signals are:  
* Mean: Mean value  
* Std: Standard deviation

### Common features
* "subject" - A subject who performed the activity. Values are IDs of the subjects of the experiment.  
* "activity" - Type of the activity.
#### Activity labels  
Activity ID | Label | Description
--- | --- | ---
1 | WALKING | Subject was walking
2 | WALKING_UPSTAIRS | Subject was walking upstairs
3 | WALKING_DOWNSTAIRS | Subject was walking downstairs
4 | SITTING | Subject was sitting
5 | STANDING | Subject was standing
6 | LAYING | Subject was laying

### Time domain signals
> The following variables are described in the **Variables** section.  

* "tBodyAccMeanX"  
* "tBodyAccMeanY"  
* "tBodyAccMeanZ"  
* "tBodyAccStdX"  
* "tBodyAccStdY"  
* "tBodyAccStdZ"  
* "tGravityAccMeanX"  
* "tGravityAccMeanY"  
* "tGravityAccMeanZ"  
* "tGravityAccStdX"  
* "tGravityAccStdY"  
* "tGravityAccStdZ"  
* "tBodyAccJerkMeanX"  
* "tBodyAccJerkMeanY"  
* "tBodyAccJerkMeanZ"  
* "tBodyAccJerkStdX"  
* "tBodyAccJerkStdY"  
* "tBodyAccJerkStdZ"  
* "tBodyGyroMeanX"  
* "tBodyGyroMeanY"  
* "tBodyGyroMeanZ"  
* "tBodyGyroStdX"  
* "tBodyGyroStdY"  
* "tBodyGyroStdZ"  
* "tBodyGyroJerkMeanX"  
* "tBodyGyroJerkMeanY"  
* "tBodyGyroJerkMeanZ"  
* "tBodyGyroJerkStdX"  
* "tBodyGyroJerkStdY"  
* "tBodyGyroJerkStdZ"  
* "tBodyAccMagMean"  
* "tBodyAccMagStd"  
* "tGravityAccMagMean"  
* "tGravityAccMagStd"  
* "tBodyAccJerkMagMean"  
* "tBodyAccJerkMagStd"  
* "tBodyGyroMagMean"  
* "tBodyGyroMagStd"  
* "tBodyGyroJerkMagMean"  
* "tBodyGyroJerkMagStd"  

### Frequency domain signals
> The following variables are described in the **Variables** section.  

* "fBodyAccMeanX"  
* "fBodyAccMeanY"  
* "fBodyAccMeanZ"  
* "fBodyAccStdX"  
* "fBodyAccStdY"  
* "fBodyAccStdZ"  
* "fBodyAccMeanFreqX"  
* "fBodyAccMeanFreqY"  
* "fBodyAccMeanFreqZ"  
* "fBodyAccJerkMeanX"  
* "fBodyAccJerkMeanY"  
* "fBodyAccJerkMeanZ"  
* "fBodyAccJerkStdX"  
* "fBodyAccJerkStdY"  
* "fBodyAccJerkStdZ"  
* "fBodyAccJerkMeanFreqX"  
* "fBodyAccJerkMeanFreqY"  
* "fBodyAccJerkMeanFreqZ"  
* "fBodyGyroMeanX"  
* "fBodyGyroMeanY"  
* "fBodyGyroMeanZ"  
* "fBodyGyroStdX"  
* "fBodyGyroStdY"  
* "fBodyGyroStdZ"  
* "fBodyGyroMeanFreqX"  
* "fBodyGyroMeanFreqY"  
* "fBodyGyroMeanFreqZ"  
* "fBodyAccMagMean"  
* "fBodyAccMagStd"  
* "fBodyAccMagMeanFreq"  
* "fBodyAccJerkMagMean"  
* "fBodyAccJerkMagStd"  
* "fBodyAccJerkMagMeanFreq"  
* "fBodyGyroMagMean"  
* "fBodyGyroMagStd"  
* "fBodyGyroMagMeanFreq"  
* "fBodyGyroJerkMagMean"  
* "fBodyGyroJerkMagStd"  
* "fBodyGyroJerkMagMeanFreq"  

## Data transformations
The dataset were downloaded from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

The following transformations were done on the original dataset in order to get the tidy dataset:  
1. The training set and the test set were merged into a single dataset.  
2. Variables which are related to a mean or a standard deviation of the measurement were extracted from the dataset.  
3. Activity IDs were replaced with a corresponding label using the labels provided with the data.  
4. Variable names were slightly cleaned:  
    * Parentheses were removed from the names
    * Dashes were removed from the names
    * "mean" was renamed to "Mean"
    * "std" was renamed to "Std"
    * "BodyBody" was renamed to "Body"
5. Independent tidy data set with the average of each variable for each activity and each subject was created.
