---
title: "Code Book"
author: "EFO"
date: "Sunday, October 26, 2014"
output: html_document
---
## About the Original Data

This data comes from recordings of 30 subjects while preforming daily activities (walking, going upstairs, downstairs, sitting, standing and laying down). The data comes from waist-mounted smartphones' built-in accelerometers and gyroscopes.

You can find the original data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [1]. The user can refer to the **README.txt** and **features_info.txt** provided with the original data to learn more about the methodology used to obtain the data.

## Transformations

The run_analysis.R script essentially pastes together the different tables from the original data set into one unified data frame. Then subsets it to include only variables of mean and standard deviation. Then it averages all variables by subject and activity.

## Variable Information

Quoting directly from the **features_info.txt** [1]:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
>
> These signals were used to estimate variables of the feature vector for each pattern:'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Hence all features (i.e. variables) have been normalized and appear in a range of [-1:1].

In the **tidy_data.txt** file you will find only the *mean*, *standard deviation* and *mean frequency* of the following features or variables all averaged by subject and activity:

* Time series Body Accelerometer XYZ-axes
* Time series Gravity Accelerometer XYZ-axes
* Time series Body Accelerometer Jerk XYZ-axes
* Time series Body Gyroscope XYZ-axes
* Time series Body Gyroscope Jerk XYZ-axes
* Time series Body Accelerometer Magnitude
* Time series Gravity Accelerometer Magnitude
* Time series Body Accelerometer Jerk Magnitude
* Time series Body Gyroscope Magnitude
* Time series Body Gyroscope Jerk Magnitude
* Frequency Body Accelerometer XYZ-axes
* Frequency Body Accelerometer Jerk XYZ-axes
* Frequency Body Gyroscope XYZ-axes
* Frequency Body Accelerometer Magnitude
* Frequency Body Accelerometer Jerk Magnitude
* Frequency Body Gyroscope Magnitude
* Frequency Body Gyroscope Jerk Magnitude

The variable names have been modified from their original version to improve readability. In the class forums there was some debate whereas to include mean frequency measurments. I figured having them there just in case wouldn't hurt anyone.

## References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
