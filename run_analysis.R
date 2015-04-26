## The following sets the working directory and read in each of the needed files

setwd("C:/Users/Kenneth/Documents/R/Get_Clean_data/UCI HAR Dataset")
actLabels <- read.table("activity_labels.txt")
fea <- read.table("features.txt")
tstX <- read.table("test/X_test.txt")
trnX <- read.table("train/X_train.txt")
tstY <- read.table("test/Y_test.txt")
trnY <- read.table("train/Y_train.txt")
tstS <- read.table("test/subject_test.txt")
trnS <- read.table("train/subject_train.txt")

## This section creates a vector corresponding to the location of the variables
##   with the word mean or std for Requirement 2.

fea$incl <- grepl("mean", fea$V2) | grepl("std", fea$V2)
incl <- fea[ which(grepl("mean", fea$V2) == TRUE | grepl("std", fea$V2) == TRUE),]

## This section trims the datasets to the mean and std variables (requirement 2)

tstX1 <- tstX[incl$V1]
trnX1 <- trnX[incl$V1]

## This section combines the training data set with the testing datasets
## Part of requirement 1

combX1 <- rbind(tstX1, trnX1)
combY <- rbind(tstY, trnY)
combS <- rbind(tstS, trnS)

## This section put in discriptive labels for requirement 4
names(combX1)<-incl$V2

## This section loads the activities Labels for requirment 3

combY <- merge(combY, actLabels, "V1")

## This section combines the id of the subjects, the discriptive activity label, 
## and the test data
## The dataset SYX is the dataset satifying the requirement 1 - 4.
 
SY <- cbind(combS, combY$V2)
names(SY) <- c("Subject", "Activity")
SYX <- cbind(SY, combX1)

## Reuirement 5. The needed result is in Summary
library(reshape2)
Molten <- melt(SYX, id.vars = c("Subject", "Activity"))
Summary <- dcast(Subject + Activity ~ variable, data = Molten, fun = mean)
write.table(Summary, "summary.txt", row.name=FALSE)
