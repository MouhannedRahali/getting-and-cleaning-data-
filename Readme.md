# getting-and-cleaning-data-
All you need to know about my final project for Getting and Cleaning Data Course

The script begins by loading the dplyr library, the download URL is assigned to a variable in R and the files are downloaded and unzipped

the files are stored in the folder corresponding to the respective working directory The data sets that will be used in both data sets, test and train (features.txt and activity_labels.txt) are loaded into memory, one contains the list of measured variables and the second the labels of the activities carried out in the experiment.

There are 3 separate files associated with each data group: one for the measurements made (X _ ???. txt), where ??? train or test as appropriate another for the subject who performed the test (subject _ ???. txt) being ??? train or test as appropriate and finally, a file that indicates which activity was carried out that was measured With the 3 files loaded, the files are joined by column into a single data set, for each of the data sets (datos_test, datos_train) then join both data sets into one, combining them by row (datos_total) The names are assigned to the columns of the combined data set, using the list of variables already stored in addition to adding names for the columns that were combined for each data set are filtered and stored in a new dataset as required (mean | std)
