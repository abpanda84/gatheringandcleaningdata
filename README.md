Course Project
========================

Scripts and Readme for Coursera's Gathring and Cleaning Data Project.

The Course project involves Gathering and Summarizing Smartphone accelerometers' and gyroscopes' data in terms of velocity and Angular momentum on the X,Y,Z axes and planes, respectively.
(Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Available data:
Training and Test Data of the smartphones of 30 subjects has been provided.

Steps involved in Summarizing Data:
------------------------------------
1. Load the Global Feature Definitions - Applies to both Training and Test Datasets
2. Load Activity Labels Definitions and Set Friendly Column Names - Applies to both Training and Test Datasets
3. Load Training Set Related Data
   3.1 Load Training Set Data
   3.2 Load Training Set Activity Lables and Set Friendly Column Names
   3.3 Load Training Set Subjects
   3.4 Add the Activity ID Column to the Training Dataset
   3.5 Add the SubjectID Column to the Training Dataset
4. Load Test Set Related Data
   4.1 Load Test Set Data
   4.2 Load Test Set Activity Labels and Set Friendly Column Names
   4.3 Load Set Set Subjects
   4.4 Add the Activity ID Column to the Test Dataset
   4.5 Add the SubjectID Column to the Test Dataset
5. Merge the Training and Test datasets
6. Assign Feature names to the Columns of the Merged Dataset
7. Assign Activity Labels
8. Parse the Feature Names dataset and pick up only those which contain the strings "Mean()" or "Std()"
9. Prepare Tidy Dataset 1 - This dataset contains only those columns picked up in Step 8
10. Prepare Tidy Dataset 2 - Melt, cast and find the means of Variable by Subject and Activity
11. Write the contents of Dataset 2 to a local Text File
12. Print Tidy Dataset 2
