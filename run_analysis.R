library(dplyr)

datasetDirName='UCI HAR Dataset'
outputFileName='tidy.txt'

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

loadSet=function(name) {
	cbind(
		read.table(
			file.path(datasetDirName,name,paste0('subject_',name,'.txt')),
			col.names='Subject'
		),
		read.table(
			file.path(datasetDirName,name,paste0('y_',name,'.txt')),
			col.names='Activity'
		) %>% mutate(Activity=activityNames[Activity]),
		read.table(
			file.path(datasetDirName,name,paste0('X_',name,'.txt')),
			colClasses=ifelse(targetFeatures,NA,'NULL'),
			col.names=featureNames
		)
	)
}

fullData=rbind(
	loadSet('train'),
	loadSet('test')
)
avgData=fullData %>% group_by(Subject,Activity) %>% summarise_each(funs(mean))
write.table(avgData,outputFileName,row.name=F)
