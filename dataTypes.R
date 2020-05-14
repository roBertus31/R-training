



#====================================================#
########             R data types             ########
#====================================================#


# Lets explore the fundamental data types in R


#' Numeric data type: 
#'            This includes short integers (<=4 digits, ie. 9999 and less)
#'            Long integers (>4 digits, ie >9999)
#'            Float point/double, or any digit with a decimal
#'    
#'    The numeric data type will default to a 'Float point/double' data type
#'    from here on refered to as a double


# a very important function in R is 'c()', which is short for 'combine'
# this will take a series of values and combine them into a simple 
# data structure called an 'atomic vector'. Atomic vectors are fundamental  
# in R, most other languages would call these 1-dimensional arrays. 
# The atomic part, only means that vectors will only be able to hold 
# data of a single type. So, if the vector holds number data, it will only
# ever be able to hold number data, unless I manually change it with additional
# code. From here on atomic vectors will simply be called vectors. The data 
# is entered inside the parentheses, and each value is separated
# by commas. Commas will always separate different values you are using 
# for all function calls in R

nums <- c(5, 10, 15, 20, 25, 30)  # create the vector data structure, and store it in a variable called 'nums'
typeof(nums)                      # what data type is contained within the 'nums' variable?
is.vector(nums)                   # is the nums variable a vector?
nums                              # show us the values within the 'nums' vector variable

# you can perform different operations on a vector of numeric values, like find the sum or mean.
sum(nums)                         # calculate the sum of all values in the vector
mean(nums)                        # calculate the mean of the values in the vector

nums[1]                           # you can also reference a specific value, or index, within a vector using square brackets
nums[5]                           # Unlike some languages, R uses a '1' reference, meaning the first index starts with a 1
                                  # as opposed to a '0' reference like python.


# R is a dynamically typed language. This means that you can change the data type of 
# particular variables after you have created the variable. This is not possible for 
# many other languages. It allows a lot of flexibility as you perform an analysis, 
# but could also come back to haunt you if you try to perform something with a variable
# that you thought was a number, but you forgot that you changed it to a character or
# some other data type. 

nums <- as.character(nums)        # change the nums vector to be character data now
typeof(nums)
nums                              # notice that the values now have double quotes around them
sum(nums)                         # we'll get an error now, because the values are now characters


# there's also several other numeric data types that can be used depending on your purpose.
# things like complex numbers ("unreal" numbers), long integers. All these different types 
# mean is that they are stored-in and use memory in different ways.

nums <- as.integer(c(5, 10, 15, 20, 25, 30))
typeof(nums)

as.complex(nums)


rm(nums)
#=================================================================================================================#

#' Character data type:
#'            This data type includes values that are literal character strings
#'            Any alphanumeric value (aAbBcC1234 etc.) as well as special characters
#'            (!@#$\/?`~ etc.). Character data is denoted between either double or 
#'            single quotations. In the example below, each item between quotes are
#'            considered a single data item, which are combined into a vector

chars <- c("Hello", "World", "!")
typeof(chars)
chars

# There's many types of functions that can be used to manipulate and connect character data

sub("Hello", "Goodbye", chars)           # we can use sub() to substitute a particular character value
chars                                    # notice that the original char variable remains unchanged.
                                         
                                         # in order to make the substitution permanent, you'll need to actually 
chars <- sub("Hello", "Goodbye", chars)  # modify the char variable with the substituted values.
chars

rm(chars)
#=================================================================================================================#

#' Boolean/logical data type:
#'          The boolean data type is a simple binary TRUE or FALSE value.

bool <- c(TRUE, FALSE, FALSE, TRUE)
typeof(bool)


# logical data types are most useful for conditonal logic, and evaluating if/then statements. This is covered more 
# in functions and writing functions. For now, some of this functionality can be demonstrated with some looping.
# Looping will also be covered in more depth later.

for(item in 1:4){                  # the for loop creates a new variable called item, then assigns it the value of 1. Any code that is found between the curly brackets will be evaluated 
                                   # It then cycles the item variable through the values between 1 and 4
  if(bool[item]==TRUE){            # In this line the 'if' statement asks if bool is 'TRUE' using the double equals sign, meaning 'exactly equal to'. 
    print("Tis true, m'Lord.")     # Everything inside this new set of curly brackets is then evaluated. If the value is TRUE, it prints the first statement
  }else{                           # The 'else' now says 'if the value is not TRUE execute the code in MY set of curly brackets' which is to print the second statement 
    print("Tis a falacy, m'Lord.")
  }
}
bool


#=================================================================================================================#
#                                                                                                                 #
#                                             Operators                                                           #
#                                                                                                                 #
#=================================================================================================================#

#' Operators are what's used in any programming language to do the things that you want the program to actually do.
#' Some examples are assignment operators which assign a value to a variable or some other object. There's logical 
#' comparison operators in order to find out if some sort of condition is TRUE or FALSE. Then there's mathematical
#' operators which will do all the maths. Oh, dear maths.

####### Assignment Operators #######

# We've already encountered the 'gets' operator '<-'. The gets operator is a uniquely R'esque operator. Every other
# programming language just uses a simple equal symbol. In R however, there's some subtle differences between the two.
# in most situations they can be interchangable. Say for instance, you're created a loop that will iterate a bunch of
# times over a column of data in a table. For each iteration of that loop, you need to store the output of that loop 
# somewhere to use later. If you were to use the '<-' to store that output data, R will end up over-writing the previous
# data with each iteration. R knows this ahead of time, so if you tried to use a '<-' to do what was described you'll get 
# an error. Instead, you should use the '=' operator which will assign data differently than how a '<-' assigns data.

# the '<-' always points to the right for assignment. If you point it to the left, if does a completely different 
# task called 'depackaging' which is a bit beyond the scope of this tutorial. If data science and machine learning
# are interesting for you, you'll definitely use a 'depackage' operator for deep-learning and neural networks.

newVar <- c(1:10)
newVar                # Either operator will accomplish the same task in this case

newNewVar = c(1:10)
newNewVar


####### Logical Operators #######

# Quite often you'll need to compare two or more things to each other to answer some sort of yes/no question.
# Ex. 
# Does this farm have a product formula in the database?
# Are there more E. coli isolates than C. perf isolates?
# Does this company have more than one complex?

# In order to do this we use logical comparison operators. They look just like math operators but have slightly different meanings

# Greater than:             '>'
# Less than:                '<'
# Exactly equal to:         '=='
# Greater than or equal to: '>='
# Less than or equal to:    '<='
# Not equal to:             '!='

3 > 4 # evaluates to FALSE 
TRUE != FALSE # evaluates to TRUE because they are not equal
3 != 4        # also evaluates to TRUE

# Logical operators are best when used with 'if' statements, and several functions which require a logical argument 

####### Mathematical Operators #######

# Mathematical operators are just like you remember in high school

# Addition:       '+'
# Subtraction:    '-'
# Division:       '/'
# Multiplication: '*'
# Exponent:       '^'

2+2   # returns 4
12/3  # also retuns 4
2^3   # returns 8

# there's also a different one called modulo
# Modulo:         '%%'

# Modulo is a special operator which checks if there's a remainder after a division. It's best use is to check if a number
# is even or odd (since an even number has a 0 remainder)

24 %% 2 # this returns 0, since 24 is even there is no remainder
23 %% 2 # this returns 1

# its really useful if used like this
num1 <- 24
num2 <- 13
# checks if num1 variable is even or odd
if(num1 %% 2==0){
  print("This is even")
}else{
  print("This is odd")
}
# now num2
if(num2 %% 2==0){
  print("This is even")
}else{
  print("This is odd")
}


# Order of operations are still a thing here, and they're exactly the same as in high school
PEMDAS
# Parentheses
# Exponent
# Multiplication
# Division
# Addition
# Subtraction