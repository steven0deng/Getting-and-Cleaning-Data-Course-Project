# Code Book for Course Project for "Getting and Cleaning Data"

## 1. The data and features
Below is diagram for the features used in this project.

                                                         Signals
                                    ________________________|__________________________
                                    |                                                 |
                              Accelerometer                                       Gyroscope
                   _________________|________________                       __________|___________ 
                   |                                |                       |                    |                       
                 Body                            Gravity                  Signal             Jerk Signal              
         __________|___________                 ____|__________         ____|__________      ____|__________
         |                    |                 |   |   |     |         |   |   |     |      |   |   |     | 
       Signal             Jerk Signal           X   Y   Z Magnitude     X   Y   Z Magnitude  X   Y   Z Magnitude 
     ____|__________      ____|__________       |   |   |     |         |   |   |     |      |   |   |     |
     |   |   |     |      |   |   |     |       t   t   t     t        t/f t/f t/f   t/f     t   t   t    t/f
     X   Y   Z Magnitude  X   Y   Z Magnitude 
     |   |   |     |      |   |   |     |
    t/f t/f t/f   t/f    t/f t/f t/f   t/f
    
The raw data is from the accelerometer and gyroscope 3-axial raw signals. The acceleration signal was separated into body and gravity acceleration signals. The body linear acceleration and angular velocity (```Signals->Accelerometer->Body->Signal``` and ```Signals->Gyroscope->Signal```) were derived in time to obtain Jerk signals (```Signals->Accelerometer->Body->Jerk Signal``` and ```Signals->Gyroscope->Jerk Signal```). The magnitude of these three-dimensional signals were calculated using the Euclidean norm. Some of the time domain (the 't' in the leaf nodes) signals were transformed into frequency domain signals (the 'f' in the leaf nodes) by applying Fast Fourier Transform (FFT). For all these singals, the mean and standard deviation were used as features. So for the total of 33 signals (both 't' and 'f'), 66 features were used.

**The 66 features used and the original feature name:**
The feature name has been transformed into descriptive names. Below is the list of them and their original names.

**Number**|**Descriptive Feature Name**|**Original Feature Name**
----------|----------------------------|-------------------------
1|MeanOfBodyAccelerometerXAxisSignalInTimeDomain|tBodyAcc-mean()-X
2|MeanOfBodyAccelerometerYAxisSignalInTimeDomain|tBodyAcc-mean()-Y
3|MeanOfBodyAccelerometerZAxisSignalInTimeDomain|tBodyAcc-mean()-Z
4|StandardDeviationOfBodyAccelerometerXAxisSignalInTimeDomain|tBodyAcc-std()-X
5|StandardDeviationOfBodyAccelerometerYAxisSignalInTimeDomain|tBodyAcc-std()-Y
6|StandardDeviationOfBodyAccelerometerZAxisSignalInTimeDomain|tBodyAcc-std()-Z
7|MeanOfGravityAccelerometerXAxisSignalInTimeDomain|tGravityAcc-mean()-X
8|MeanOfGravityAccelerometerYAxisSignalInTimeDomain|tGravityAcc-mean()-Y
9|MeanOfGravityAccelerometerZAxisSignalInTimeDomain|tGravityAcc-mean()-Z
10|StandardDeviationOfGravityAccelerometerXAxisSignalInTimeDomain|tGravityAcc-std()-X
11|StandardDeviationOfGravityAccelerometerYAxisSignalInTimeDomain|tGravityAcc-std()-Y
12|StandardDeviationOfGravityAccelerometerZAxisSignalInTimeDomain|tGravityAcc-std()-Z
13|MeanOfBodyAccelerometerXAxisJerkSignalInTimeDomain|tBodyAccJerk-mean()-X
14|MeanOfBodyAccelerometerYAxisJerkSignalInTimeDomain|tBodyAccJerk-mean()-Y
15|MeanOfBodyAccelerometerZAxisJerkSignalInTimeDomain|tBodyAccJerk-mean()-Z
16|StandardDeviationOfBodyAccelerometerXAxisJerkSignalInTimeDomain|tBodyAccJerk-std()-X
17|StandardDeviationOfBodyAccelerometerYAxisJerkSignalInTimeDomain|tBodyAccJerk-std()-Y
18|StandardDeviationOfBodyAccelerometerZAxisJerkSignalInTimeDomain|tBodyAccJerk-std()-Z
19|MeanOfGyroscopeXAxisSignalInTimeDomain|tBodyGyro-mean()-X
20|MeanOfGyroscopeYAxisSignalInTimeDomain|tBodyGyro-mean()-Y
21|MeanOfGyroscopeZAxisSignalInTimeDomain|tBodyGyro-mean()-Z
22|StandardDeviationOfGyroscopeXAxisSignalInTimeDomain|tBodyGyro-std()-X
23|StandardDeviationOfGyroscopeYAxisSignalInTimeDomain|tBodyGyro-std()-Y
24|StandardDeviationOfGyroscopeZAxisSignalInTimeDomain|tBodyGyro-std()-Z
25|MeanOfGyroscopeXAxisJerkSignalInTimeDomain|tBodyGyroJerk-mean()-X
26|MeanOfGyroscopeYAxisJerkSignalInTimeDomain|tBodyGyroJerk-mean()-Y
27|MeanOfGyroscopeZAxisJerkSignalInTimeDomain|tBodyGyroJerk-mean()-Z
28|StandardDeviationOfGyroscopeXAxisJerkSignalInTimeDomain|tBodyGyroJerk-std()-X
29|StandardDeviationOfGyroscopeYAxisJerkSignalInTimeDomain|tBodyGyroJerk-std()-Y
30|StandardDeviationOfGyroscopeZAxisJerkSignalInTimeDomain|tBodyGyroJerk-std()-Z
31|MeanOfBodyAccelerometerMagnitudeInTimeDomain|tBodyAccMag-mean()
32|StandardDeviationOfBodyAccelerometerMagnitudeInTimeDomain|tBodyAccMag-std()
33|MeanOfGravityAccelerometerMagnitudeInTimeDomain|tGravityAccMag-mean()
34|StandardDeviationOfGravityAccelerometerMagnitudeInTimeDomain|tGravityAccMag-std()
35|MeanOfBodyAccelerometerJerkMagnitudeInTimeDomain|tBodyAccJerkMag-mean()
36|StandardDeviationOfBodyAccelerometerJerkMagnitudeInTimeDomain|tBodyAccJerkMag-std()
37|MeanOfGyroscopeMagnitudeInTimeDomain|tBodyGyroMag-mean()
38|StandardDeviationOfGyroscopeMagnitudeInTimeDomain|tBodyGyroMag-std()
39|MeanOfGyroscopeJerkMagnitudeInTimeDomain|tBodyGyroJerkMag-mean()
40|StandardDeviationOfGyroscopeJerkMagnitudeInTimeDomain|tBodyGyroJerkMag-std()
41|MeanOfBodyAccelerometerXAxisSignalInFrequencyDomain|fBodyAcc-mean()-X
42|MeanOfBodyAccelerometerYAxisSignalInFrequencyDomain|fBodyAcc-mean()-Y
43|MeanOfBodyAccelerometerZAxisSignalInFrequencyDomain|fBodyAcc-mean()-Z
44|StandardDeviationOfBodyAccelerometerXAxisSignalInFrequencyDomain|fBodyAcc-std()-X
45|StandardDeviationOfBodyAccelerometerYAxisSignalInFrequencyDomain|fBodyAcc-std()-Y
46|StandardDeviationOfBodyAccelerometerZAxisSignalInFrequencyDomain|fBodyAcc-std()-Z
47|MeanOfBodyAccelerometerXAxisJerkSignalInFrequencyDomain|fBodyAccJerk-mean()-X
48|MeanOfBodyAccelerometerYAxisJerkSignalInFrequencyDomain|fBodyAccJerk-mean()-Y
49|MeanOfBodyAccelerometerZAxisJerkSignalInFrequencyDomain|fBodyAccJerk-mean()-Z
50|StandardDeviationOfBodyAccelerometerXAxisJerkSignalInFrequencyDomain|fBodyAccJerk-std()-X
51|StandardDeviationOfBodyAccelerometerYAxisJerkSignalInFrequencyDomain|fBodyAccJerk-std()-Y
52|StandardDeviationOfBodyAccelerometerZAxisJerkSignalInFrequencyDomain|fBodyAccJerk-std()-Z
53|MeanOfGyroscopeXAxisSignalInFrequencyDomain|fBodyGyro-mean()-X
54|MeanOfGyroscopeYAxisSignalInFrequencyDomain|fBodyGyro-mean()-Y
55|MeanOfGyroscopeZAxisSignalInFrequencyDomain|fBodyGyro-mean()-Z
56|StandardDeviationOfGyroscopeXAxisSignalInFrequencyDomain|fBodyGyro-std()-X
57|StandardDeviationOfGyroscopeYAxisSignalInFrequencyDomain|fBodyGyro-std()-Y
58|StandardDeviationOfGyroscopeZAxisSignalInFrequencyDomain|fBodyGyro-std()-Z
59|MeanOfBodyAccelerometerMagnitudeInFrequencyDomain|fBodyAccMag-mean()
60|StandardDeviationOfBodyAccelerometerMagnitudeInFrequencyDomain|fBodyAccMag-std()
61|MeanOfBodyAccelerometerJerkMagnitudeInFrequencyDomain|fBodyBodyAccJerkMag-mean()
62|StandardDeviationOfBodyAccelerometerJerkMagnitudeInFrequencyDomain|fBodyBodyAccJerkMag-std()
63|MeanOfGyroscopeMagnitudeInFrequencyDomain|fBodyBodyGyroMag-mean()
64|StandardDeviationOfGyroscopeMagnitudeInFrequencyDomain|fBodyBodyGyroMag-std()
65|MeanOfGyroscopeJerkMagnitudeInFrequencyDomain|fBodyBodyGyroJerkMag-mean()
66|StandardDeviationOfGyroscopeJerkMagnitudeInFrequencyDomain|fBodyBodyGyroJerkMag-std()

The features were taken from files "X\_train.txt" and "X\_test.txt".

## 2. The Activities
The activities were taken from files "y\_train.txt" and "y\_test.txt". And the encoded activities were transformed into labels with the encoding in the file "activity_labels.txt". Below is the encoding.

**Number**|**Activity**
----------|------------
1|WALKING
2|WALKING_UPSTAIRS
3|WALKING_DOWNSTAIRS
4|SITTING
5|STANDING
6|LAYING

## 3. The Subjects
The subjects were taken from files "subject\_train.txt" and "subject\_test.txt". The subjects are 1 to 30.

## 4. The Result
The result of the script is a file called "average\_by\_activity\_subject.txt". The data are the average of the respective feature for the whole set of data grouped by "Activity" and "Subject".