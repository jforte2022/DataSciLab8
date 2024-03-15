# Function 1: Create a function called "readStates":
#Step 1: Create a function (named readStates) to read a CSV file into R: within the Function 1
#Q1. You need to read a URL, not a local file to your computer.
#Q2. The file is a dataset on state populations (within the United States).
# The URL is: http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv
# In case you have trouble using this url, use this csv file nst-est2011-01.csv  Download nst-est2011-01.csv and read the file locally using read.csv function.
#Step 2: Clean the dataframe: within Function 1
#Q3. Note the issues that need to be fixed (removing columns, removing rows, removing dots in front of the state names, changing column names).
#Q4. Within your function, make sure there are 51 rows (one per state + the district of Columbia). Make sure there are only 5 columns with the columns having the following names (stateName, Census, Estimates, Pop2010, Pop2011).
#Q5. Make sure the last four columns are numbers (i.e. not strings).

readStates <- function(urlToRead){
  censusFrame <- read.csv(url(urlToRead))
  censusFrame <- censusFrame[-1:-8,]
  censusFrame <- censusFrame[,1:5]
  censusFrame <- censusFrame[-52:-58,]
  censusFrame$stateName <- censusFrame[,1]
  censusFrame <- censusFrame[,-1]
  censusFrame$stateName <- gsub("\\.","", censusFrame$stateName)
  censusFrame$Census <- gsub(",", "", censusFrame$X)
  censusFrame$Estimates <-gsub(",", "", censusFrame$X.1)
  censusFrame$Pop2010 <- gsub(",", "", censusFrame$X.2)
  censusFrame$Pop2011 <- gsub(",", "", censusFrame$X.3)
  censusFrame$Census <- as.numeric(gsub("", "", censusFrame$Census))
  censusFrame$Estimates <- as.numeric(gsub("", "", censusFrame$Estimates))
  censusFrame$Pop2010 <- as.numeric(gsub("", "", censusFrame$Pop2010))
  censusFrame$Pop2011 <- as.numeric(gsub("", "", censusFrame$Pop2011))
  censusFrame <- censusFrame[,-1:-4]
  rownames(censusFrame) <- NULL
  return(censusFrame)
}

#Step 3: Store and explore the dataset: outside of Function 1
#Q6. Store the dataset into a dataframe, called dfStates.
# When you run the following, it should print a clean dataframe. Please include the output of "dfStates" in the compiled file by running dfStates as below. 

urlToRead <- "http://www2.census.gov/programs-surveys/popest/tables/2010-2011/state/totals/nst-est2011-01.csv"
dfStates <- readStates(urlToRead)
dfStates

#Q7. Test your dataframe by calculating the mean for the 2011 data, by doing (include your output):

mean(dfStates$Pop2011)

#Step 4: Find the state with the highest population: outside the Function 1
#Q8. Based on the 2011 data, what is the population of the state with the highest population? What is the name of that state, and what is the value of the population?

highestPop <- max(dfStates$Pop2011)
index <- which.max(dfStates$Pop2011)
highestPopName <- dfStates[index, 1]
highestPop
highestPopName

#Q9. Sort the data, in decreasing order, based on the 2011 data.

sortedStates <- dfStates[order(-dfStates$Pop2011), ]
sortedStates

# Function 2: Create a function called "Distribution"
#Step 5: Explore the distribution of the states: You need to create a new function called "Distribution"

#Q10. You will write a function to calculate percentage of states that have population that is lower than the average.  The function (function name: "Distribution") takes two parameters. The first is a vector and the second is a number. For example, Distribution <- function(vector, number). This step is just a setup for the following instruction. 

# The function will return the percentage of elements within the vector that is less than the number (i.e. cumulative distribution below the value provided). For example,  

# (1) Think about this: You only keep the elements within the vector that are less than the number, and store the number of eligible elements into the variable "count". Populate XXXX to complete this line of code: 
# (2) Then, you will calculate the percentage and return the results. Populate XXXX to complete this line of code:
# (3) Test the function with the vector “dfStates$Pop2011”, and the mean of “dfStates$Pop2011.” *** you should get 66.66667 as a result. There are many ways to write this function (described in point 10) – so please try to write multiple versions of this function – which do you think is the best?

Distribution <- function(vector, number){
  count <- length(vector[vector < number])
  return(count / length(vector) * 100)
}

Distribution(dfStates$Pop2011, mean(dfStates$Pop2011))