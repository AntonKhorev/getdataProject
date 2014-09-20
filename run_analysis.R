library(dplyr)

# filename='getdata_projectfiles_UCI HAR Dataset.zip'
datasetDirName='UCI HAR Dataset'

features=read.table(
	file.path(datasetDirName,'features.txt'),
	col.names=c('FeatureIndex','FeatureName')
)
featureNames=gsub('\\(|\\)','',features$FeatureName)
targetFeatures=grepl('-(mean|std)\\(\\)',features$FeatureName)

activities=read.table(
	file.path(datasetDirName,'activity_labels.txt'),
	col.names=c('ActivityIndex','ActivityName')
)
activityNames=activities$ActivityName

loadSet=function(dirName) {
	cbind(
		read.table(
			file.path(datasetDirName,dirName,'subject_test.txt'),
			col.names='Subject'
		),
		read.table(
			file.path(datasetDirName,dirName,'y_test.txt'),
			col.names='Activity'
		) %>% mutate(Activity=activityNames[Activity]),
		read.table(
			file.path(datasetDirName,dirName,'X_test.txt'),
			colClasses=ifelse(targetFeatures,NA,'NULL'),
			col.names=featureNames
		)
	)
}

t=loadSet('test')
