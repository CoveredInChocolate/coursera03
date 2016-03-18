# ReadMe

This repository is for the **Coursera - Data Science - 03 Getting and Cleaning Data** Project.

### Files
Here is a list of the following files included in this repository:
* README.md - you are reading it, buddy!
* codebook.md - A brief instruction on data.frames and columns in the final result.
* features_info_mod.txt - Modified file with info regarding the data.
* run_analysis.R - Project R-script for getting and cleaning data.

### Analysis Files
Download the project data from the following URL:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After extracting the data, set the location of the folder "UCI HAR Dataset" as the working directory in the R-script run_analysis.R and run it. It will produce two data.frames with tidy data:

**dataset**  
This data.frame contains the data from both the test and trial. The columns are Subject, Activity and one column for every mean/standard deviation.
    
**datamean**  
An aggregate table of dataset. Contains Subject and Activity, but now the mean of all the mean/standard deviation values. There is one row of means for every subject and activity (with a total of 40 rows).

**Edit test**
    



