Getting and Cleaning Data - Course Project
==========================================

This repository hosts the R code and documentation files for the Data Science's track course "Getting and Cleaning data", available in coursera.

The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Files in repo
==============

`CodeBook.md` describes the variables, the data, and any transformations or work that was performed to clean up the data.

`run_analysis.R` contains all the code to perform the analyses described in the 5 steps. They can be launched in RStudio by just importing the file.

`averages_data.txt` contains the output of the run_analysis.R script.

Library prerequisites:
=======================

- data.table 1.9.4
- plyr 1.8.1

Environment structure:
==================

- Working directory: ../UCI HAR Dataset