# Output file `tidy.txt`

Use this *R* command to read the output file:

    data <- read.table('tidy.txt', header = TRUE)

## Output file columns

* `Subject`: identifiers of the subject who carried out the experiment
* `Activity`: activity names as specified in `UCI HAR Dataset/activity_labels.txt`
* the rest, features: average values of selected features across all experiments for given *Subject* and *Activity*

See `UCI HAR Dataset/features_info.txt` for details on features.
Only `-mean()` and `-std()` features are provided in the table.

Feature names are modified for readability in *R*: parentheses removed and dashes changed to dots.
For example, `tBodyAcc-mean()-X` is presented as `tBodyAcc.mean.X`.
