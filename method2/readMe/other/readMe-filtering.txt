FILTERING APPROACh-explicitcrossval_time
Description-
All electrodes, threshold, and classes have been put in a single matrix.
Everything is trained together categorically.
Training matrix has again been put into the classifier to identify those electrodes and thresholds which yielded high accuracy.
Testing matrix has been predicted only in those regions and mode of highest occuring class has been considered

If filtering is needed then put a filer to the training matrix initially



codes-
"explicitcrossval_time" for prediction
"main" for dataset formation
cell form dataset implies it is explicitcrossval_time

results-


conclusion-
very much complicated classifier

Filtering is like a cupcake cutter with a separate cutter for each class.
Whichever cutter has been used for the class, it gets predicted into that class.