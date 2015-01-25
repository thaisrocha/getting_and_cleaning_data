#Code Book

The script run_analysis.R performs the 5 steps described in the course project's definition.

Step 1 - the  sets training and test are merged using rbind() function to create one data set(X, Y and Subject).

Step 2 -  Read features.txt and extracts only those columns with the mean and standard deviation for each measure.

Step 3 - Reads activity_labels.txt and applies descriptive activity names to name the activities in the data set: 
walking, walkingupstairs, walkingdownstairs, sitting, standing and laying

Step 4 - the script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity names are converted to lower case, underscores and brackets () are removed.
The result is saved as merged_clean_data.txt

Step 5 - we generate a new dataset with all the average measures for each subject and activity type. The result is saved as data_average.txt

#Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
X, Y and Subject merges the previous datasets to further analysis.
features contains the correct names for the X dataset, which are applied to the column names stored in mean_std_features.
A similar approach is taken with activity names through the activities variable.
cleaned merges Subject, Y and X in one data set.
The script creates a 2nd, independent tidy data set with the average of each measurement for each activity and each subject. The output is the file data_average.txt
