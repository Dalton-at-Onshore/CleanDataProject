# Gather Labels and Features information to apply to data
    
    # Set directory path
    UCIdir <- paste(getwd(),"UCI HAR Dataset",sep="/")
    
    # Load
    Lbls <- read.table(paste(UCIdir,"activity_labels.txt", sep="/"), stringsAsFactors=FALSE)[,2]
    Feats <- read.table(paste(UCIdir, "features.txt", sep="/"), stringsAsFact=FALSE)[,2]
    
    # Create vector to subset data for variables including "mean" and "std"
    FeatsSub <- grepl("mean|std", Feats)

# Load data files
    
    # Test files
        
        # Reset directory path
        UCIdir <- paste(getwd(),"UCI HAR Dataset","test", sep="/")

        # Load
        TestLbls <- read.table(paste(UCIdir,"y_test.txt", sep="/"), col.names="labels")
        TestSub <- read.table(paste(UCIdir,"subject_test.txt", sep="/"), col.names="subject")
        TestData <- read.table(paste(UCIdir,"X_test.txt", sep="/"))

    # Train files
        
        # Reset directory path        
        UCIdir <- paste(getwd(),"UCI HAR Dataset","train", sep="/")

        # Load
        TrainLbls <- read.table(paste(UCIdir,"y_train.txt", sep="/"), col.names="labels")
        TrainSub <- read.table(paste(UCIdir,"subject_train.txt", sep="/"), col.names="subject")
        TrainData <- read.table(paste(UCIdir,"X_train.txt", sep="/"))


# Apply Features to column names
    
    #TestData
    names(TestData) = Feats
        
    #TrainData
    names(TrainData) = Feats

# Apply Labels to data
    
    #TestData
    TestData = TestData[,FeatsSub]
    TestLbls[,1] = Lbls[TestLbls[,1]]
    names(TestLbls) <- "activity"
        
    #TrainData
    TrainData = TrainData[,FeatsSub]
    TrainLbls[,1] = Lbls[TrainLbls[,1]]
    names(TrainLbls) <- "activity"

# Combine Test and Train data into one table
TandTdata <- rbind(cbind(TestSub, TestLbls, TestData),
                   cbind(TrainSub,TrainLbls,TrainData))

# Aggregate TandTdata by average record for each subject and each activity
TandTdata <- aggregate(TandTdata[, 3:ncol(TandTdata)],
                       by=list(subject = TandTdata$subject,activity = TandTdata$activity),
                       mean)

# Write TandTdata to tidy_data text file in working directory
write.table(TandTdata, paste(getwd(),"tidy_data.txt"), row.names=TRUE)
