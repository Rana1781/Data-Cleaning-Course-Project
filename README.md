---
title: "README.md"
author: "SRRana"
---

Course : Getting and Cleaning Data (Project)
=============================================

This solved problem in ``R Language`` is the part of the course project named ``Getting and Cleaning Data`` 

1. First download the file from the given link in the course project webpage in coursera.
2. Unzip all the files
3. Then an R script named ``run_analysis.R`` where all the code should be run.
4. Read the train data and test data and feature names from the respective files.
5. Load the data(x's) feature, activity info and extract columns named 'mean'(`-mean`) and    'standard'(`-std`).
6.Also, modify column names to descriptive. (`-mean` to `Mean`, `-std` to `Std`, and remove symbols like `-`, `(`, `)`)
7. Extract data by selected columns(from step 3), and merge x, y(activity) and subject data.
   Also, replace y(activity) column to it's name by refering activity label (loaded step 3).
8. Finally, write the ``tidy data set`` to the ``tidy_data.txt`` file. Done!