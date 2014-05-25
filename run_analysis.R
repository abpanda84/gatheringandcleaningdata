library(reshape2)

##Global Definitions that apply to both Training and Test Datasets
## Load the Feature Definitions
globalFeaturesDef <- read.table("./UCIHARDataset/features.txt")

## Load Activity Labels Definitions and Set Friendly Column Names
globalActivLabelDef <- read.table("./UCIHARDataset/activity_labels.txt")
colnames(globalActivLabelDef) <- c("ActivityId","ActivityLabel")

## Load Training Set Related Data

## Load Training Set Data
trainSetData <- read.table("./UCIHARDataset/train/X_train.txt")

## Load Training Set Activity Lables and Set Friendly Column Names
trainSetLabels <- read.table("./UCIHARDataset/train/y_train.txt")
colnames(trainSetLabels) <- c("ActivityId")

## Load Training Set Subjects
trainSetSubject <- read.table("./UCIHARDataset/train/subject_train.txt")
colnames(trainSetSubject) <- c("SubjectId")

## Add the Activity ID Column to the Training Dataset
trainSetData <- cbind(trainSetData,trainSetLabels)

## Add the SubjectID Column to the Training Dataset
trainSetData <- cbind(trainSetData,trainSetSubject)

## Load Test Set Related Data	
## Load Test Set Data
testSetData <- read.table("./UCIHARDataset/test/X_Test.txt")
                          
                          ## Load Test Set Activity Labels and Set Friendly Column Names
                          testSetLabels <- read.table("./UCIHARDataset/test/y_Test.txt")
                          colnames(testSetLabels) <- c("ActivityId")
                          
                          ## Load Set Set Subjects
                          testSetSubject <- read.table("./UCIHARDataset/test/subject_test.txt")
                          colnames(testSetSubject) <- c("SubjectId")
                          
                          ## Add the Activity ID Column to the Test Dataset
                          testSetData <- cbind(testSetData,testSetLabels)
                          
                          ## Add the SubjectID Column to the Test Dataset
                          testSetData <- cbind(testSetData,testSetSubject)
                          
                          
                          ## Merge the Training and Test datasets
                          mergData <- rbind(trainSetData,testSetData)
                          
                          ## Assign Column names to the Merged Data set- Pick up column names from the Features dataset
                          featureNames <- as.vector(globalFeaturesDef$V2)
                          featureNames <- c(featureNames,"ActivityId","SubjectId")
                          ##################rbind(globalFeaturesDef,as.frame(c(562,"ActivityID")))
                          colnames(mergData) <- featureNames
                          
                          ## Assign Activity Labels
                          mergData <- merge(mergData,globalActivLabelDef,by.x="ActivityId",by.y="ActivityId",ALL=FALSE)
                          
                          ##Parse the Column names that measure Mean() or Std()
                          colVector <- as.vector(globalFeaturesDef$V2)
                          parsedColVector <- vector('character')
                          print(length(parsedColVector))
                          count <- 0
                          for (i in 1:length(colVector))
                          {
                            if (grepl("mean()", colVector[i]) | grepl("std()", colVector[i]) >0)
                            {
                              parsedColVector[length(parsedColVector)+1] <- colVector[i]
                              count <- count + 1
                            }
                            
                          }
                          
                          ## Prepare Tidy Dataset 1
                          tidyDataset1 <- mergData[,augmentParsedColVector]
                          
                          ## Prepare Tidy Dataset 2
                          meltDataset1 <- melt(tidyDataset1,id=c("SubjectId","ActivityLabel"),measure.vars = parsedColVector)
                          tidyDataset2 <- dcast(meltDataset1, SubjectId + ActivityLabel ~ variable)
                          
                          ## Write the cast data to a Text File
                          write.table(tidyDataset2, "./myTidyDataSet2.txt", sep="\t") 
                          
