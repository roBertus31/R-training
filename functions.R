#====================================================================================#
#                                                                                    #
#                             Writing Functions                                      #
#                                                                                    #
#====================================================================================#

#' When creating a larger process or algorithm, you'll generally have a over-arching goal
#' in mind regarding what it is that you hope you're able to accomplish. Once you know 
#' what that goal is, you'll need to break down how to acheive that goal. 
#' 
#' For example, say we need to build a sub-routine that will take input mPCR data
#' and then tell us what the Clostridium species is from that data. In this case
#' the goal is to find the species IDs from each isolate culture's genomic DNA.
#' We can split this larger goal into smaller goals, like first we need to 
#' read the mPCR data into the R environment for analysis. Then we need to link
#' that mPCR data with the isolate's lab IDs. Next we need to find out which
#' band shows us what the isolate ID actually is. This is where individual functions
#' come into play


# a function is an abstract concept in computer programming. All it is, is a set of 
# instructions that will perform some task on a set of input that the programmer
# tells the function to use. 

# Here's a simple example:

# an R function has a couple components.Those components are used to 'define' what that
# function is named, what it does, and what it gives back to the programmer. 
# That's why in python you define a function using the keyword 'def'

addingFunc <- function(x, y){  # instead of 'def' we use a gets operator, with the name of the function you define.     
                               # Inside the parentheses, after the function name are the arguments that you want the 
                               # function to do something to. Put the instructions you want the function to 
                               # perform inside curly brackets {}
  output <- x + y              # This function will take the input arguments, x and y, and add them together, and store 
                               # that sum in a new variable called output.
                              
  return(output)               # at the end, we tell the function to 'return' a value, in this case it returns the output variable
}

# now we call the function using a variety of inputs
addingFunc(1, 2)   # the function outputs 3
addingFunc(25, 2)  # the function outputs 27  
addingFunc(200000000000000000000000, 2000000000000000000000)   # the function outputs 2.02e+23


#' Some rules to follow with writing and using functions
#' 
#' 1. Each function should only do one job
#'    It can be tempting to write a single function that will do the entire process that you're trying to code.
#'    While that's absolutely possible, it's just not a good idea. If one part of the function doesn't work
#'    then it's even harder to figure out which part doesn't work
#'
#' 2. Bugs will always happen. It's unavoidable.
#'    Without fail, the functions you write will at one point or another have unintended consequences. The 
#'    best way to combat this is to write clean code, meaning each function does one job, it's well annotated
#'    with comments (lines that start with the # character to describe the intended behavior), it's spaced in 
#'    a way that it's almost human-readable text.
#'    
#' 3. Use additional # characters to make it easier to see where different functions occur in your code.
#'    I use three lines of # characters at the beginning and end of each function to make it easier to read
#'    
#'    Example:
######################################################################################
######################################################################################
######################################################################################

# function to generate the summary values needed for each bird type and store that
# data in a list object
summaryVals <- function(df, variables){
  sampVals <- df %>% 
    summarise_at(.vars = vars(variables),
                 .funs = funs(nsamps = n(),
                              noDetc = sum(length(which(.==0))),
                              mean(.,na.rm = TRUE),
                              min(.,na.rm = TRUE),
                              max(.,na.rm = TRUE))) %>% 
    tidyr::gather("name", "value") %>% 
    tidyr::separate("name", c("name", "sumMetric"), sep = "_")
  return(sampVals)
}

######################################################################################
######################################################################################
######################################################################################


# Function abilities are only limited by what you can imagine for them to be able to do. You can write functions 
# that will only add or multiply numbers, they can format text input into something else like a sentence, you can read in 
# data and process that data into something that is useful for visualzations. Literally anything you can imagine.

# the function above is a more complex function that will use some data in the R environment, 
# and then process it into a new data structure, called a list.

# the function below will reformat a date character string
######################################################################################
######################################################################################
######################################################################################

# reformat the date into MM/DD/YYYY format
DateFormat<-function(x){
  gsub(" ","",gsub(" 0","",format(x," %m/ %d/%Y")))
}

######################################################################################
######################################################################################
######################################################################################

DateFormat(Sys.Date())


# Functions can really be custom tailored to what ever needs you have for what you're coding at the time.
# You can even call other functions within functions.

# Example:
######################################################################################
######################################################################################
######################################################################################

saySomething <- function(text1, text2){
  
  whatToSay <- paste(text1, text2, ", Is what she said.") # the 'paste()' function is part of base R
  
  return(whatToSay)
  
}

######################################################################################
######################################################################################
######################################################################################


#' The most important part of knowing what keywords are functions, and which are not is the use of
#' parenthses. Any time you call, or use, a function you type the name of that function,
#' then use parenthses to enter your input arguments, each argument is separated by a comma.
 
# func. name   arg1          arg 2
saySomething("Whatchu", "talkin' bout!") 

# some functions are super complex! This is the ifelse() function in base R. It's also
# poorly annotated, in my opinion. Someone else, wrote this one, years and years ago.
######################################################################################
######################################################################################
######################################################################################

function (test, yes, no) 
{
  if (is.atomic(test)) {
    if (typeof(test) != "logical") 
      storage.mode(test) <- "logical"
    if (length(test) == 1 && is.null(attributes(test))) {
      if (is.na(test)) 
        return(NA)
      else if (test) {
        if (length(yes) == 1) {
          yat <- attributes(yes)
          if (is.null(yat) || (is.function(yes) && identical(names(yat), 
                                                             "srcref"))) 
            return(yes)
        }
      }
      else if (length(no) == 1) {
        nat <- attributes(no)
        if (is.null(nat) || (is.function(no) && identical(names(nat), 
                                                          "srcref"))) 
          return(no)
      }
    }
  }
  else test <- if (isS4(test)) 
    methods::as(test, "logical")
  else as.logical(test)
  ans <- test
  len <- length(ans)
  ypos <- which(test)
  npos <- which(!test)
  if (length(ypos) > 0L) 
    ans[ypos] <- rep(yes, length.out = len)[ypos]
  if (length(npos) > 0L) 
    ans[npos] <- rep(no, length.out = len)[npos]
  ans
}

######################################################################################
######################################################################################
######################################################################################

#' IMPORTANT!!!
#' If you ever have any questions about a particular function or a particular package of functions
#' you can simply type ?<function name> into the console below, and a help window will show up in the
#' bottom right of the Rstudio IDE explaining the function. Any developer worth their weight will
#' have documented all of their functions before they release their code for programmers to use.

# Example: Copy and paste the lines below into the console and press enter . . . 

?ifelse
?dplyr::mutate
?gsub
?length

#' When you call a function the returned value can be stored in a variable in the R environment. 
#' This is how you can perform some task, and then store that output to be used again later in a
#' program or process

newData <- rnorm(n = 10, mean = 1)
newData

otherNewData <- newData/10
otherNewData


######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################
######################################################################################

#===================================================================================#
#                                   Your turn!!!                                    #
#===================================================================================#

#' Using everything covered in dataTypes, dataStructures, FlowControl, and now functions
#' complete the exercises below to get some added practice with writing R code.
#' 
#' Instructions:
#' Once you've written your code, run the lines you've written to save your 
#' code and variables to the global environment. Then run the lines with the 
#' test functions to check your work.

# Run the lines below to load the tests for the exercises
rm(list = ls())
source("./exerciseTests.R")

#####################################################################################
#===================================================================================#
# Create a numeric vector, called numVect,  with values between 1 and 100, in any order



# Test your work #
numVectTest(numVect)

# extract the 85th element from numVect, and store that in a new variable called
# nthElement



# Test your work #
numVectElemTest(nthElement)

# create a simple function that will add 2 to each element in numVect. Call that function
# and store it's output in a variable called newNumVect



# Test your work #
funcVectTest(newNumVect)

# More challenging:
# Create a function that will add the elements of numVect together so that the the 
# first element will be added to the second element, the second to the third, the 
# third to the fourth, and so on. For this you'll need to use flow-control and 
# data structure manipulation. Store the output from that function in a new 
# variable called challengeComplete




challengeTest(challengeComplete)

#####################################################################################
#===================================================================================#

# Now we'll switch gears and look at dataframe manipulation

# Use the dataframe object for these exercises.
View(dataframe)
# subset the firstName column and store that in a variable called fName



# Test your work #
colTest(fName)

# Create and empty dataframe named emptyDF



# Test your work #
dfTest(emptyDF)

# extract the first two rows of the dataframe object into a new data frame called xtract



# Test your work #
xtractTest(xtract)

# create a new column in dataframe called fullName that is column 1 and column 2 pasted together



# Test your work #
colTest(dataframe)
colValTest(dataframe)

# Using any method you prefer, filter dataframe for only the guitarists. Store that filtered 
# data frame in a new object called guitars



# Test your work #
guitarTest(guitars)
