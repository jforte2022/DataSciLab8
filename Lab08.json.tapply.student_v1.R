#install.packages("RCurl")
library(RCurl)
## Loading required package: bitops
#install.packages("RJSONIO")
library(RJSONIO)
library(sqldf)
library(tidyverse)

fileURL <- "https://opendata.maryland.gov/resource/rqid-652u.json"
#fileURL <- "http://opendata.maryland.gov/resource/rqid-652u.json"
#just in case the link above does not work, use the json file provided instead. 

######### 1. investigate the url above.
######### 2. covert the JSON format dataset into R objects
mydata <- Populate here 
# look into the data summary
summary(mydata)

######### 3. what is the data type of "mydata" after reading the URL using the appropriate function.  
Populate here to write your script to check the data type of mydata

######## 4. Print the number of rows below.
umRows <- Populate here 
numRows
#nameList1 <-names(mydata[[1]])

# Step 2: Clean the data

#If you investigate mydata, you will find the length of each element is different. We must make it consistent.
#try map_df function to flatten mydata to a dataframe
mydata2 <- your code here..

#then create a dataframe from it.
df1 <- data.frame(mydata2, stringsAsFactors = FALSE)

#change the name of each variables.with meaningful names (column names of the original data)
extract meaningful names from the original data. You need to create two separate columns to include both longitude and latitude
The total number of columns would be seven columns

# > nameList
# [1] "cc_number"                   "date"                        "time"                       
# [4] "accident_type"               "latitude"                    "longitude"                  
# [7] ":@computed_region_r4de_cuuv"

#names(df1) <- nameList1
# rename the rest of columns

#create day of week variable
#convert characters to the proper data formats (numeric or date format)
#When the dataframe is created, following is the column names:
  #   > names(df1)
  # [1] "cc_number"                    "date"                         "time"                        
  # [4] "accident_type"                "latitude"                     "longitude"                   
  # [7] "X..computed_region_r4de_cuuv" "day_of_week"  


#convert/standardize all the accident_type values from accroym to meaninigful terms.
#The Maryland Open Data Portal documentation is not correct. 
#So, you have to print out all the unique values included in the accident_type column and their frequency.    
############## Clean the data 
#4.1 Print out all the values and their frequencies here..

#4.2 Merge the values so that the final values include only three categories: 
#######Property Damage (pd, PD, Property Damage Crash), Personal Injury (PI and Injury Crash), and Fatal Crash (F)
Your code here...


# Step 3: Understand the data using SQL (via SQLDF)
############## 5. how many accidents happen on Sunday?
# Use sql to count how many accidents on "Sunday"
sun_acc <- Populate here 
# Print the result
print(sun_acc)


############## 6. how many accidents had injuries? Read the documentation from the Maryland Open Data portal.
#Use sql to count how many obersavations meet the criterion that accident type is Injury Crash
inj_acc <- Populate here #5
# Print the result
print(inj_acc)

# list the injuries by day
# count the number of injuries for each day of the week
list_inj <- Populate here #6

# Print the result
print(list_inj)

# Step 4: Understand the data using tapply
###########7.how many accidents happen on SUNDAY?

# tapply(Summary Variable, Group Variable, Function):
# apply the length function on the "Sunday" subset of the column day_of_week
tapply(Populate here #7)

# how many accidents had injuries
# apply the length function

# list the injuries by day
# apply the length function on subset of the column accident_type broken down by the value in Wday_of_week 
# and accident_type == "Injury Crash"
tapply(Populate here #8)

###########8: What is the percentage of injury for all accidents?
########## 9. Which day of a week do you observe the most injury?