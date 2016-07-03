This is a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data.

Run_analysis.R runs through the steps described in README.

Data that has the same number of columns is merged with the rbind() function. As per instructions, the mean (mean()) and the standard deviation (std()) is calculated, following extraction of those columns, they are given names from features.txt.
Because activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt. Finally, I corrected the names of the columns and generated a new, final dataset. This is in the averages_data.txt file.

Variables:
subject - represents a single person in the study
activity - describes the type of physical activity the measurements are associated with, such as: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

The averages of those calculations were then determined for each unique combination of Subject and Activity. These averages, along with their corresponding Subject ID and Activity Name are what is written to the output file.