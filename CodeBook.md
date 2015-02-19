Data transformations
====================

All necessary data transformations are performed within the run_analysis.R script.
No additional actions are required to process the original data set.

In more detail, the script is divided into the following sections:

- Extract data from `features.txt`
- Extract data from `activity_labels.txt`
- Extract data from `X_test.txt` and `X_train.txt` and merge them into the `measure_data` table
- Set feature names in `measure_data` table
- Extract only mean and sd data from `measure_data` table
- Extract data from `subject_test.txt` and `subject_train.txt` and merge them into the `subjects` table
- Extract data from `y_test.txt` and `y_train.txt` and merge them into the `activities` table
- Set activity names on `activities` table
- Merge `subjects`, `activities` and `measure_data` tables into `all_data` table
- Compute and export an independent tidy data set with the average of each variable for each activity and each subject

Exported data set variables
===========================

- `subject`: Refers to the ID of the subject that participated in the test
- `activity`: Refers to the activity that the subject was performing while testing the equipment
- `rest of the variables`: 
They are a subset of the variables contained in the original data set.
The subset contains variables that were produced using the `mean()` and `std()` functions, out of total 17 different functions.
Basic information of all variables can be found in the `features_info.txt` file contained in the original data set.