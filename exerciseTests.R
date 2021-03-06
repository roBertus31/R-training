
firstName <- list("John", "Paul", "George", "Ringo")
lastName <- list("Lennon", "McCartney", "Harrison", "Starr")
instrument <- list("Guitar", "Bass", "Guitar", "Drums")
living <- list("No", "Yes", "No", "Yes")

dataframe <- data.frame(cbind(firstName, lastName, instrument, living))
rm(firstName, lastName, instrument, living)

######################################################################################
######################################################################################
######################################################################################

numVectTest <- function(x){
  if(length(x)==100 & max(x)==100 & min(x)==1){
    print("That's it!!!")
  }else{
    print("Mmm, not quite. Try it again")
  }
}

######################################################################################
######################################################################################
######################################################################################

numVectElemTest <- function(x){
  if(x==85){
    print("Nice work!")
  }else{
    print("Almost, give it another shot.")
  }
}

######################################################################################
######################################################################################
######################################################################################

funcVectTest <- function(x){
  if(isTRUE(all.equal((c(1:100)+2), x))){
    print("Dang, you're good!")
  }else{
    print("Try it again, I believe in you!")
  }
}


######################################################################################
######################################################################################
######################################################################################

challengeTest <- function(x){
  z <- c(1:100)
  y <- c()
  for(i in 1:length(z)){
    y[i] <- z[i] + z[i+1]
  }
  if(isTRUE(all.equal(y, x))){
    print("What the?! Are you trying to take Rob's job!!??")
  }else{
    print("Remember, you can change an element in a vector with square brackets []")
  }
}

######################################################################################
######################################################################################
######################################################################################

colTest <- function(x){
  if(isTRUE(all.equal(x, dataframe[1]))){
    print("You did it!")
  }else{
    print("Almost . . .")
  }
}

######################################################################################
######################################################################################
######################################################################################

dfTest <- function(x){
  if(is.data.frame(x)){
    print("That's it!")
  }else{
    print("Not quite what I'm expecting")
  }
}

######################################################################################
######################################################################################
######################################################################################

xtractTest <- function(x){
  if(length(x)==4 & nrow(x)==2 & x[1,1]=="John" & x[2,1]=="Paul"){
    print("Perfect!")
  }else{
    print("Give it another shot.")
  }
}

######################################################################################
######################################################################################
######################################################################################

newColTest <- function(x){
  if("fullName" %in% colnames(x)){
    print("Column is there!")
  }else{
    print("I'm not seeing that column . . .")
  }
}

colValTest <- function(x){
  check <- c("John Lennon", "Paul McCartney", "George Harrison", "Ringo Starr")
  if(isTRUE(all.equal(x[,5], check))){
    print("Names are there too")
  }else{
    print("Hmm, the names don't quite match")
  }
}

######################################################################################
######################################################################################
######################################################################################

guitarTest <- function(x){
  
  if(nrow(x)==2 & "John Lennon" %in% x[,5] & "George Harrison" %in% x[,5] ){
    print("Rock star!")
  }else{
    print("Small adjustment, and you're there.")
  }
}

















