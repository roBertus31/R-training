#######################################################
# Creating data structures
#######################################################
#' In the data types file, vectors (or atomic vectors for uber correctness) were briefly mentioned.
#' Now we'll explore vectors and other data structures more deeply. This is not a comprehensive
#' look at ALL of the data structures available in R, only the ones that will be encountered the most.


########## Vectors ##########


# use a colon between the numbers to fill a vector with all values that fall between two values
vect1 <- c(1:10)      
vect1

# this is different from using a comma. The comma will only fill the vector with the values explicitly given

vect2 <- c(1,10)
vect2

# you can type all of the values, yourself, but to save keystrokes, you should just use the colon

vect3 <- c(1,2,3,4,5,6,7,8,9,10)
vect3
all.equal(vect1, vect3) # vect1 and vect3 are exactly the same thing, just created differently

# this can also be done with alphabet characters using a special data call 'letters' for lower
# case alphabet characters, or 'LETTERS' for upper case alphabet characters

vect4 <- letters
vect4

vect5 <- LETTERS
vect5

# There is a concept in R called 'coercion'. What this means is that if you try to put 
# different data types into the same vector, all of the values you put into that vector will be coerced 
# into the data type which takes up the most memory. This way all values will automatically be allocated
# the same amount of RAM when its created.

vect6 <- c(1, 2, TRUE, "hola!")
typeof(vect6)                    # vect7 is of type 'character' since a character data type takes up the most memory

# You can also create vectors with other R functions

# the seq() function will create a sequence of numbers. The first argument is the value to start at, the second 
# argument is the value to end the sequence at, and the third argument is the steps each individual value will be
# placed at
?seq
vect7 <- seq(1, 10, 1)
typeof(vect7)
all.equal(vect1, vect7)


# Sometimes you'll need to access a specific element within a vector.
# You can use square brackets[] to subset which elements to use

vect1[3:7]
vect4[3:7]

# the square brackets used to subset a vector can also be used to assign a new value to that element in a vector
vect7[4] <- 25
vect7

########## Matrices ##########

# Vectors can be thought of as 1-dimensional, meaning that there's only a length component to it.
length(vect7)

#' Matrices are essentially a 2-dimensional vector. Generally, the equivalent of what we would call a table.
#' There's a length component, as well as a 'depth' or 'height' component, if you will. Each row of a matrix
#' is a single vector, as well as each column. We can easily create a generic matrix with the matrix() function

matrix(1:9, nrow = 3, ncol = 3)

# the first argument is the individual values that will be used to fill the matrix, in this case values between 1 and 9.
# the second argument is the number of rows for the matrix, and the third argument is the number of columns for
# the matrix. You could easily omit either the row or column argument, since you're already defining that 9 individual
# values be used to fill the matrix, and still get the same result

matrix(1:9, ncol = 3)
matrix(1:9, nrow = 3)

# notice that the values are filled from the top to bottom, from left to right. This is how R will fill a data structure
# in general, and it also show the priority of each vector in the matrix. A matrix is stored in memory in column-centric order.
# You can easily subset rows or columns, or an individual value in a matrix using a matrix's index. Indices in R
# are 1-based, meaning that the first index in a vector, or a row/column of a matrix is 1 (as opposed to 0 for many other
# languages). Just like vectors, you subset using square brackets []. The first value in the brackets corresponds to the
# row index, and the second value corresponds to the column index.

matr <- matrix(1:9, ncol = 3, nrow = 3)
matr
matr[2,]    # subset the second row of the matrix
matr[,1]    # subset the first column of the matrix
matr[3,3]   # subset the value in the third row, third column of the index

# subsetting a matrix like this, however, will yield a vector as output. Sometimes this may not be what you're hoping for
# in order to avoid that, use the argument 'drop = FALSE' when you subset, inside the square brackets

matr[,1,drop = FALSE]
matr[2,,drop = FALSE]

# A nice thing about matrices is that you can associate specific names for each row or column.

matr <- matrix(1:9, ncol = 3, nrow = 3, dimnames = list(c("row1", "row2", "row3"), c("A", "B", "C")))
matr

# you could also give the rows and columns names with the rownames() and colnames() functions after creating 
# a matrix from other data.

matr <- matrix(1:9, ncol = 3, nrow = 3)
matr
rownames(matr) <- c("row1", "row2", "row3")
colnames(matr) <- c("A", "B", "C")
matr

# you can then subset the matrix using the associated row and column names

matr["row2",]
matr["row2",, drop=FALSE]
matr[,"A"]
matr[,"A", drop=FALSE]


########## Lists ##########

#' Lists are a modified type of vector. With a vector you can only have a single data type contained within.
#' With a list, you could have different data types contained within. This comes in really handy when you're 
#' generating summary data where you'll need numeric values for averages or isolate counts, but also character
#' values like farm name or who collected the samples, even boolean values for if that farm was on product or not.
#' Just like matrices, you can name each of the elements in a list, which allows for very easy reference when
#' putting data into a report, or presenting an analysis.

list1 <- list("Ave" = 4200, "Units" = "CFU/g", "Isos" = 328, "Product" = TRUE)
list1

# the easiest way to reference individual values within a named list is the $ character

list1$Ave
list1$Product

# You can then use this to easy put together a statement relating to that summary data

paste("The average count was", list1$Ave, list1$Units, "and", list1$Isos, "isolates were collected.")

# if the list is not named then you could also easily reference element within that list using the indices that
# depending on the length of the list.

list2 <- list(4200, "CFU/g", 328, TRUE)
list2

# in this case we need to use a double bracket to acces an individual element within a list

list2[[2]]

# This section is short but really, lists are fantastic and are used all the time!


########## Data Frames ##########

#' By far the data structure that you will encounter the most, and use the most is the data frame.
#' A Data frame's best analogy is an excel spreadsheet. There's a massive number of functions that 
#' are developed just to use data within, and add data to data frames. Probably R's best feature, hands-down
#' is the data frame and what it is capable of doing. What a data frame essentially is, is a list of lists
#' All of the ways that you would access elements in a list is how you would access elements of a data frame
#' as well ways you access elements in a matrix or a vector. Most functions that load data into an 
#' R environment load that data as a data frame into memory

df <- data.frame("Experience" = c(5, 3, 2), "First Name" = c("Jane", "Mary", "John"), "Last Name" = c("Doe", "Curie", "Lennon"))
df

# column names and row names can be accessed and altered in the same way as matrices
colnames(df)
colnames(df) <- c("Exp", "fNames", "lNames")
colnames(df)

# The most useful way to access elements of a data frame is with its name attribute
attributes(df)
df$Exp
df$fNames

# you can also access specific components within a column using square brackets in conjunction with the column name
df$fNames[2]

# adding new columns to a data frame is very easy. Use the name of the data frame, with a $ character, then type he
# name of the new column you're creating.

df$Position <- c("Manager", "Technician", "Technician")
df

# you could also use other functions to create the data meant for new columns
df$ExpDiff <- df$Exp-max(df$Exp)
df

df$FullName <- paste(df$fNames, df$lNames)
df

# A lot of times you're only going to want certain rows of a particular data frame. This is the 
# equivelant of the filter feature of excel. Filtering your data can be done many different ways.
# Probably the most verbose way to filter, but also the most effective, is to use a combination of 
# functions. which(), and grep() with some conditional operators will do nicely. We'll need to 
# reference which rows and columns to apply these functions using square brackets []. Just like a 
# matrix, data frame reference indices are number based, with a comma to separate rows from 
# columns. The first value within the brackets is the row index, and the second value
# is the column index.
?which
?grep

df[,4] # will print all of the values contained in the fourth column
df[1,] # will print all of the values in the first row

# subset the data frame based on years of experience


dfExp <- df[which(df$Exp>=3),]  # here we use the which() function which requires that what we enter in the parentheses 
                                # evaluate to either TRUE or FALSE. The output of the which() function is the index in the 
which(df$Exp>=3)                # data structure where the condition evaluates to TRUE, in this case rows 1 and 2

df$Exp>=3

# Here rows 1 and 2 in the experience column met our condition of being greater than or equal to 3. 
# we can just as easily exclude rows or columns in our filtering by placing a '-' sign before the which 
# function call. 

dfExp <- df[-which(df$Exp>=3),]  # by including the '-' we're essentially saying "rows that are NOT greater than or equal to 3".
                                 # What is literally happening is a '-' symbol is being placed in front of the number where which()    
-which(df$Exp>=3)                # evaluates to TRUE. This causes R to exclude those row indices from the data frame.

# grep() can be used if you're filtering based on a text value within the data frame. Say we only want to find rows
# in the data frame where the 'Position' column contains 'technician'. 

grep("technician", df$Position)

# Uh-oh. This says that there's zero values in that column which contain "technician". Technically, that's correct.
# R is case sensitive. So "technician" in the eyes of R, is separate and distinct from "Technician. Let's try it again.

grep("Technician", df$Position)

# That worked! A lot of times though, you will have no idea if values are capitalized or not, and when there's 4000 rows 
# of data, it's going to take way longer to find out if you were to scan over each row manually. Instead, you can 
# use the 'ignore.case' argument to the grep() function

grep("technician", df$Position, ignore.case = TRUE)

# this will get you what you're looking for.

dfPos <- df[grep("technician", df$Position, ignore.case = TRUE),]

# here's some other useful grep()-like functions . . . 
?grepl
?regexec

# as well as some additional information about regular expressions
?regex


# contained within the tidyverse of packages is a package called dplyr. This contains TONS of 
# useful tools for manipulating data in data frames.

# There's a couple ways to include code from an outside package. The first is to use the function library(). This will
# load that package in it's entirety, even the parts that you won't need at that time. 

library(<package name>) # if you run this line, there will be an error. That's ok.
?library

# If you only need one function you can use a double-colon along with the package name to just get that one function

dplyr::filter()  # if you run this line, there will be an error. That's ok.
?dplyr::filter

# The filter function is a super useful tool, it's used often and heavily

dplyr::filter(df, Position == "Technician")  # the argurments to filter() also need to be a logical statement that will 
dplyr::filter(df, Exp >= 3)                  # evaluate to either TRUE or FALSE. filter() is, however, case sensitive
                                             # so you'll need to know whether you're looking for upper or lower case spellings.
                                             # Notice that filter() works on both character and numeric data.

# Once you've finished this file, run the lines below to clean up the R-environment navigate to the next 
# file in this training series...

rm(list = ls())
rstudioapi::navigateToFile( "FlowControl.R" )
