#####################################################################################
#===================================================================================#
# Create a numeric vector, called numVect,  with values between 1 and 100, in any order

  numVect <- c(1:100)

# Test your work #
numVectTest(numVect)

# extract the 85th element from numVect, and store that in a new variable called
# nthElement

  nthElement <- numVect[85]

# Test your work #
numVectElemTest(nthElement)

# create a simple function that will add 2 to each element in numVect. Call that function
# and store it's output in a variable called newNumVect

addingVect <- function(x){
  y <- x + 2
  return(y)
}

newNumVect <- addingVect(numVect)
# Test your work #
funcVectTest(newNumVect)

# More challenging:
# Create a function that will add the elements of numVect together so that the 
# first element will be added to the second element, the second to the third, the 
# third to the fourth, and so on. For this you'll need to use flow-control and 
# data structure manipulation. Store the output from that function in a new 
# variable called challengeComplete

addingChal <- function(x){
  y <- c()
  for(i in 1:length(x)){
    y[i] <- x[i] + x[i+1]
  }
  return(y)
}

challengeComplete <- addingChal(numVect)

challengeTest(challengeComplete)

#####################################################################################
#===================================================================================#

# Now we'll switch gears and look at dataframe manipulation

# Use the dataframe object for these exercises.
View(dataframe)
# subset the firstName column and store that in a variable called fName

fName <- dataframe[1]

# Test your work #
colTest(fName)

# Create and empty dataframe named emptyDF

emptyDF <- data.frame()

# Test your work #
dfTest(emptyDF)

# extract the first two rows of the dataframe object in a new data frame called xtract

xtract <- dataframe[c(1,2),]

# Test your work #
xtractTest(xtract)

# create a new column in dataframe called fullName that is column 1 and column 2 pasted together

dataframe$fullName <- paste(dataframe$firstName, dataframe$lastName)

# Test your work #
newColTest(dataframe)
colValTest(dataframe)

# Using any method you prefer, filter dataframe for only the guitarists. Store that filtered 
# data frame in a new object called guitars

guitars <- dplyr::filter(dataframe, instrument == "Guitar")
                   # OR #
guitars <- dataframe[grep("guitar", dataframe$instrument, ignore.case = TRUE),]

# Test your work #
guitarTest(guitars)
