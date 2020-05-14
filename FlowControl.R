#====================================================================================#
#                                                                                    #
#                             Program Flow Control                                   #
#                                                                                    #
#====================================================================================#

#' One of the most, if not the most important part of progamming in general is the concept of 
#' flow-control. This is the way we can use conditions and logical operators for the program to 
#' 'make decisions' about what the next step in process will be. There are some important  
#' keywords in R (and any other progamming language for that matter) which cannot be overwritten. These 
#' statements include 'if', 'else', 'for', 'while','function', 'in', 'vector', 'list', etc. In terms of 
#' program flow, we need to first consider loops.

#' Loops are very important because this is how you will repeat a set of instructions over and over again
#' in order to accomplish a task. 


########### the 'for' loop ###########

# The for loop will take a pre-specified number of iterations and then perform a set of instructions inside curly 
# brackets that many times.

for(value in sequence){
  some coded statements go here
}

# You can specify a number of times a task is completed different ways. 

# Example:

for(i in 1:10){
  print(i)
}

# the loop will continue to repeat until the final condition is met. So, the first iteration, we've defined i = 1,
# it will then print the value of i. i is then incremented to the next value in the series of numbers defined between
# the parentheses, i = 2. It then prints that value. This will continue until i is greater than the highest value specified,
# 10. 'For' and 'while' loops could get you into trouble. If the final condition that will stop the loop can never be met,
# then the loop will just keep repeating for ever and ever, and ever, and ever, and . . .

# In our experience, a never ending 'for' loop is hard to come by. There's always a last row to the data that 
# we analyze. If we forget to define that last row, then we'll end up getting an error when the loop gets there, 
# and then the loop will still stop.

# Lets make some data to work with, then use a for loop to manipulate that data

data <- c(2, 6, 3, 13, 24, 99, 124)

numTrue <- 0
for(i in data){
  if(i %% 2 == 0){           # notice the if statement if(condition is True){do something coded here}
    numTrue = numTrue + 1
  }
}
print(numTrue)
 
# another really easy way to accomplish what we just did is to use the ifelse() function

numTrue <- ifelse(data%%2==0, 1, 0)  # ifelse() follows this syntax ifelse(condition, if true do this, if false do this)
sum(numTrue)

# the for loop allowed us to specify a set number of times to do a task. The ifelse() function has
# that capability built in. It's what's called vectorized in R jargon.

########### the 'while' loop ###########

# The while loop will evaluate what is in the parentheses, and see if that statement is TRUE. If the statement
# is TRUE, then it will execute the instructions inside the curly brackets {}. If the statement is false, then 
# what's in the curly brackets will never be executed. This loop is different from the for loop in that the
# test in parentheses is evaluated before the body of the loop is executed. In a for loop, the body of the 
# loop is executed regardless of any conditional test, as long as the sequence is still valid.

# basic syntax
while(condition to test){
  some code to execute
}

# here's a quick example

i <- 1
while(i < 10){
  print(i)
  i = i + 1
}

# notice it only printed to 9. That's because i reached the value of 10 and is no longer less than 10
# if we want 10 to print then we need to change the loop

i <- 1
while(i <= 10){ # the <= means 'less than OR equal to'
  print(i)
  i = i + 1
}

# it's very important to make sure your condition in the parenthese will eventually evaluate to FALSE
# or else the loop will never stop running

i <- 11
while(i > 10){
  print(i)
  i = i + 1
}

# this loop will repeat infinitely since the value of i will always be greater than 10


#============================================================================================================#
#                                                                                                            #
#                                     Conditional Logic/if and ifelse                                        #
#                                                                                                            #  
#============================================================================================================#

########### If statement ###########

#' The if statement is a way to evaluate whether or not some sort of logical condition exists

# basic synatax

if(condition to test){
  
  some code to execute

  }else{
  
    some other code to execute

  }

# Earlier we saw an example of 'if' and the ifelse() function. The biggest difference between these two
# is that 'if' will only check the condition once. Ifelse() on the other hand is vectorized. This means 
# that if you need to perform that 'if' condition test repeatedly you won't need to put your 'if' statement
# into a 'for' loop in order to check each element in a data structure.

colA <- rnorm(n = 10, mean = 10, sd = 0.5)
colB <- rnorm(n = 10, mean = 10, sd = 0.5)

df <- as.data.frame(cbind(colA, colB))

# using If statement
if(df$colA < 10){
  df$colC <- "less"
}else{
  df$colC <- "not less"
}

df
# notice that the new column is entirely "not less". This is because the 'if' statement that we wrote
# only evaluates the first element, in this case 10.236992. This is not less than 10, and so the if 
# statement executes the code in the first curly brackets. However, the 'if' statement doesn't evaulate 
# again for any other element in that column, and so all of the new column is "not less".

# in order for each element of that column to be evaluated for the 'if' statement, we need to use the 
# vectorized ifelse() function.
df$colC <- ifelse(df$colA < 10, "less", "not less")
df

# now we see that each value of that column was evaluated correctly

# basic syntax for ifelse()
ifelse(Condition to test, code if true, code if false)

# there's also a repeat loop. However it's not a good idea to use it. I've never seen it used, and have
# never used it. It's really a relic of very old versions of R, and is probably going to be discontinued
# in future releases. I'm not even going to cover it in this tutorial.