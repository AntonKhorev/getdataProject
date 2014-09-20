# filename='getdata_projectfiles_UCI HAR Dataset.zip'
datasetDirName='UCI HAR Dataset'

features=read.table(
	paste(datasetDirName,'features.txt',sep='/'),
	col.names=c('FeatureIndex','FeatureName')
)
targetFeatures=grep('-(mean|std)\\(\\)',features$FeatureName)

loadSet=function(dirName) {
	cbind(
		read.table(
			paste(datasetDirName,dirName,'subject_test.txt',sep='/'),
			col.names='Subject'
		),
		read.table(
			paste(datasetDirName,dirName,'y_test.txt',sep='/'),
			col.names='Activity'
		),
		read.table(
			paste(datasetDirName,dirName,'X_test.txt',sep='/'),
		)
	)
}

# t=loadSet('test')
