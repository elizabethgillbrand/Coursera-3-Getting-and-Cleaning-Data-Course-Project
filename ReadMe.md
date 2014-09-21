How to peer review my course project for "Getting and Cleaning Data"
========================================================

Initial Conditions
------------------
Please ensure that you have the following files in your working directory:
* the script, “run_analysis.R”   
* the folder, “UCI HAR Dataset”   
* the codebook, "Codebook.Rmd"   

   
Steps in the Code Review Process
--------------------------------
* Open R and run the script called "run_analysis.R" using this code:   
```
source(run_analysis.R)
run_analysis()
```

* Review the codebook called, "Codebook.Rmd" to understand how to interpret the tidy data file   
```
source(Codebook.Rmd)
```   
* Evaluate the quality of the end result by reading and viewing the resulting data file called, "tidy_data.xml" using this code:   
```
data <-read.table(“tidy_data.txt”, header = TRUE)
View(data)
```
Source: https://class.coursera.org/getdata-007/forum/thread?thread_id=49   

   
Overview of the Function   
--------------------------------
The function "run_analysis.R" performs the following steps  

###  Reads in component data files and stitches them together
The data files are stitched together following this schematic: https://class.coursera.org/getdata-007/forum/thread?thread_id=49#comment-570   

### Extracts from the entire dataset only those variables that measure mean and standard deviation 
* This step is executed by subsetting just those measures that have the text string “mean()” or “std()” at the end of the measure name, e.g. “tBodyAcc-mean()-X”   
* The extracted dataset does NOT include measures that have the text string “mean” or “std” earlier in the measure name, e.g. “fBodyAccJerk-meanFreq()-X”   
* The extracted dataset is stored in a table called “extracted_dataset”   

### Reads in variable names and activity labels; transforms them to descriptive names and labels; and appends to the extracted dataset

Good data hygiene requires that variable names and activity labels should be *(source: “Editing Text Variables” lecture by Jeff Leek)*:   
* all lower case   
* descriptive   
* not duplicated   
* not have underscores, dots or white spaces   

Variable names and activity labels were joined to the dataset following this schematic: https://class.coursera.org/getdata-007/forum/thread?thread_id=49#comment-570   

### Takes the extracted dataset and turns it into a tidy dataset called, “tidy_data”   

Here are the properties of a tidy dataset *(source: Hadley Wickham , “Tidy Data”; Journal of Statistical Software)*   
* Each variable forms a column   
* Each observation forms a row   
* Each table/file stores data about one kind of observation   



