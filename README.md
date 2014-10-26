---
title: "README"
author: "EFO"
date: "Sunday, October 26, 2014"
output: html_document
---
## What is this?

This repository was created as a project for the [*Getting and Cleaning Data*](https://class.coursera.org/getdata-008/) [1], which consisted in taking some data from the internet and tidying it up. You can find the original data [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) [2] and you can learn more about it in the **CodeBook.md** file in this repository.

The project required students to write R script that performs the following tasks with the original data:

1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions

In order to get the tidy data set you just need to download the file called **run_analysis.R**. In R set your working directory with setwd() to the folder where you downloaded the file. Then run:

```
source('./run_analysis.R')
```
That's it! In the same folder you are working on you will see the output file **tidy_data.txt**.

## References

[1] Getting and Cleaning Data by Jeff Leek, PhD, Brian Caffo, PhD, Roger D. Peng, PhD. Course offered at Coursera and authorized by Johns Hopkins University. https://class.coursera.org/getdata-008/

[2] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
