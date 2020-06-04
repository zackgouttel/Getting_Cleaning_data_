library(dplyr)
read_merge<-function(path1="./train/X_train.txt",path2="./test/X_test.txt",label1,label2,user_id1=userid1,user_id2=userid2)
{ df1<-read.table(file = path1, header = FALSE) #Reading the train dataset into R
  df2<-read.table(file= path2, header= FALSE)#Reading the test dataset into R
  df_mean_std_train<-select(df1,
                  V201,V202,V227,V228,V240,V241,V253,V254,V503,V504, #Selecting the mean and standard deviation columns
                  V516,V517,V529,V530,V542,V543)
  names(df_mean_std_train)<-c(                                 #Renaming the columns into a descriptive set of names
    "BodyAcceleration_Eucledian_mean",
    "BodyAcceleration_Eucledian_standard_deviation",
    "GravityAcceleration_Eucledian_mean",
    "GravityAcceleration_Eucledian_standard_deviation",
    "BodyAccelarationJerk_Eucledian_mean",
    "BodyAccelarationJerk_Eucledian_standard_deviation",
    "BodyGyro_Eucledian_mean",
    "BodyGyro_Eucledian_standard_deviation",
    "BodyAcceleration_Eucledian_mean_Fourier",
    "BodyAcceleration_Eucledian_standard_deviation_Fourier",
    "GravityAcceleration_Eucledian_mean_Fourier",
    "GravityAcceleration_Eucledian_standard_deviation_Fourier",
    "BodyAccelarationJerk_Eucledian_mean_Fourier",
    "BodyAccelarationJerk_Eucledian_standard_deviation_Fourier",
    "BodyGyro_Eucledian_mean_Fourier",
    "BodyGyro_Eucledian_standard_deviation_Fourier")
  
  df_mean_std_train$label<-label2 #adding the activity label to the train dataset from global environment made vector
  cbind(df_mean_std_train,user_id2) #adding the subject id to the train dataset from global environment made vector
                              
                              

  df_mean_std_test<-select(df2,
                            V201,V202,V227,V228,V240,V241,V253,V254,V503,V504, #Selecting the mean and standard deviation columns for the test dataset
                            V516,V517,V529,V530,V542,V543)
  names(df_mean_std_test)<-c(
                              "BodyAcceleration_Eucledian_mean",
                              "BodyAcceleration_Eucledian_standard_deviation",
                              "GravityAcceleration_Eucledian_mean",
                              "GravityAcceleration_Eucledian_standard_deviation",
                              "BodyAccelarationJerk_Eucledian_mean",
                              "BodyAccelarationJerk_Eucledian_standard_deviation",
                              "BodyGyro_Eucledian_mean",                                       #Renaming the columns into a descriptive set of name
                              "BodyGyro_Eucledian_standard_deviation",
                              "BodyAcceleration_Eucledian_mean_Fourier",
                              "BodyAcceleration_Eucledian_standard_deviation_Fourier",
                              "GravityAcceleration_Eucledian_mean_Fourier",
                              "GravityAcceleration_Eucledian_standard_deviation_Fourier",
                              "BodyAccelarationJerk_Eucledian_mean_Fourier",
                              "BodyAccelarationJerk_Eucledian_standard_deviation_Fourier",
                              "BodyGyro_Eucledian_mean_Fourier",
                              "BodyGyro_Eucledian_standard_deviation_Fourier")
df_mean_std_test$label<-label1                                                    #Adding the activity label to the test data set from global environment made vector
cbind(df_mean_std_test,user_id1)                                              # adding the subject id to the test data set from global environment made vector
finaldata<-rbind.data.frame(df_mean_std_train,df_mean_std_test)                   #merging the data
      
}
