The following changes were made to the data

1. The column Activity was based on the 'test_Y.txt' and 'train_Y.txt' files.
   The values in these two files are numerics.
   The values in the resulting file is based on the file 'activity_labels.txt.
   
2. The row headings and the values of the final file 'SYX', a dataframe, are as follows

   (a) The first column
      (i) Heading is 'Subject'. It is the id of the subjects in the experiment.
      (ii) The values are based on the files 'subject_test.txt' and 'subject_train.txt'.
   
   (b) The second column
      (i) Heading 'Activity'.
      (ii) The values are the based on the files 'Y_test.txt' and 'Y_train,txt' but translated 
         into discriptive label using 'activity_labels.txt'
   
   (c) The remaining columns (3 - 81)
      (i) Heading are from the file 'features.txt'. The heading are the values from this file in sequential order. 
      (ii) The values are the data from the files 'X_test.txt' and 'X_train.txt'.
      (iii) Triming of the file. Not all data of these three files ('features.txt','X_test.txt' and 'X_train.txt') are
         included. Only variable representing means and standard deviations are included. To facilitate this selection the
         variables with the word mean or std are included. Also the angles between vectors are not included. The X_test.txt
         and X_train.txt have 561 columns. The trimmed file has only 79 columns.
   
   (d) The rows.
      (i) The first 2947 rows are from the test files
      (ii) The remaining 7352 rows are from the train files   
