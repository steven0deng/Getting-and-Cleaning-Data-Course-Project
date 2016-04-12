library(dplyr)
################################################################################
# Step 1: Merges the training and the test sets to create one data set.
##   1.1: Load and combine X_train and X_test into X
X_train <- read.table('./data/train/X_train.txt')
X_test <- read.table('./data/test/X_test.txt')
X <- rbind(X_train, X_test)
#
##   1.2: Load and combine y_train and y_test into y
y_train <- read.table('./data/train/y_train.txt')
y_test <- read.table('./data/test/y_test.txt')
y <- rbind(y_train, y_test)
#
##   1.3: Load and combine subject_train and subject_test into subject
subject_train <- read.table('./data/train/subject_train.txt')
subject_test <- read.table('./data/test/subject_test.txt')
subject <- rbind(subject_train, subject_test)
#
##   1.4: Combine X, y and subject into one data frame
data <- cbind(X, y, subject)
#
################################################################################
# Step 2: Extracts only the measurements on the mean and standard deviation for
#         each measurement. i.e. feature names containing "mean()" and "std()"
##   2.1: Load feature list and set feature names for combined dataset.
##        The last two columns are 'y' and 'subject'.
features <- read.table('./data/features.txt')
colnames(data) <- c(as.character(features[,2]), 'y', 'subject')
#
##   2.2: Only selected features and 'y', 'subject' columns are kept
keptColumns <-  c(as.character(features[grep('mean\\(\\)|std\\(\\)',
                                                  features[,2]),2]),
                                    'y', 'subject')
data <- data[, keptColumns]
#
################################################################################
# Step 3: Uses descriptive activity names to name the activities in the
#         data set.
##   3.1: Map the activity code in 'y' column to activity label 
##        in new column 'activity'
activity_labels <- read.table('./data/activity_labels.txt',
                         col.names = c('seqno','label'))
data <- mutate(data, activity = activity_labels[data$y, 2]) # Add new column
data <- data[, names(data) != 'y'] # Drop the original 'y' column
#
################################################################################
# Step 4: Appropriately labels the data set with descriptive variable names.
##   4.1: Create function for the naming transformation
descriptiveName <- function(x){
    meanOrStd <- ifelse(
        length(grep('mean\\(\\)',x))>0,
        'MeanOf',
        ifelse(length(grep('std\\(\\)',x))>0,
            'StandardDeviationOf',
            '') )
    accOrGyro <-ifelse(length(grep('gyro',tolower(x)))>0,
                       'Gyroscope',
                       ifelse(length(grep('body',tolower(x)))>0,
                              'BodyAccelerometer','GravityAccelerometer'
                       ) )
    axis <- ifelse(length(grep('(-X)|(-Y)|(-Z)$',x))>0,
                   paste0(substr(x, nchar(x),nchar(x)),'Axis'),
                   '')
    jerk <- ifelse(length(grep('jerk',tolower(x)))>0,
                   'Jerk',
                   '')
    signalOrMag <- ifelse(length(grep('Mag',x))>0,
                          'Magnitude',
                          'Signal' )
    domain <- ifelse(length(grep('^t',x))>0,
                     'InTimeDomain',
                     'InFrequencyDomain')
    
    ifelse(length(grep('activity',tolower(x)))>0,
        'Activity',
        ifelse(length(grep('subject',tolower(x)))>0,
               'Subject',
               paste0(meanOrStd,accOrGyro,axis,jerk,signalOrMag,domain)
        )
    )
}
#
##   4.2: Apply the naming transformation to the data set
colnames(data) <- sapply(colnames(data), descriptiveName)
#
################################################################################
# Step 5: Creates a second, independent tidy data set with the average of
#         each variable for each activity and each subject
##   5.1: Group the data by activity and subject and summarize each column using mean
average_by_activity_subject <-  data %>% group_by(Activity, Subject) %>%
    summarize_each(funs(mean), -(Subject:Activity))
#
##   5.2: Write the data frame into txt files, without row names
write.table(average_by_activity_subject,'average_by_activity_subject.txt', 
            row.names = FALSE)