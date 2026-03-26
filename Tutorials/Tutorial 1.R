#--------------------------------#
# Introduction to Econometrics II 
# Nicolás Campos Bijit 
# Tutorial 1: Introduction to R
#--------------------------------#

#----------------#
# Cleaning in R
#----------------#

# Remove all objects 
rm(list=ls())

# Remove only one object
rm(data1)

# If I want to clear the console I have to press ctrl + L. 

#---------------------------#
# A. RStudio Interface   ####
#---------------------------#

#  1. 4 sections
#  2. (#) to write comments. 
#  3. Write outlines: organize long codes. 
#     ctrl + shift + O: view outline

# RStudio is a vehicle to use R


#-------------------------------------------#
# B. Package installation and help       ####
#-------------------------------------------#

#--------------------------------#
## 1. Libraries               ####
#--------------------------------#

# This can be done in two ways: 

# 1. From the "packages" tab in the lower right corner 
# 2. Using commands

install.packages("dplyr")

# Multiple packages at once
install.packages(c("dplyr","ggplot2","rio"))

# Common error
install.packages("dplyr", ggplot2)

# In general, it is good to install packages at the beginning of your work
# since we commonly use the same libraries when doing data analysis. 
# With this function we tell R to install the package if it is not installed 
# (typical when switching computers)

if(!require(dplyr)) {install.packages("dplyr")}

# Load libraries 
library(dplyr)

# If we want to see what is inside each package
ls("package:dplyr", all = TRUE) # ls = list objects

# Important: the PACKAGE must be installed ONCE,
but loaded every time it is used.

# Many times there are updates. To check and install them: 
update.packages()

#--------------------------------#
## 2. Help function           ####
#--------------------------------#

# 1. About a particular function 
help(mean)
?mean
mean # press F1 
sd 

# 2. About a particular package
help("dplyr")
library(help="dplyr")

# 3. Built-in tutorials in RStudio.
install.packages("learnr")
library(learnr)

# 4. To search for specific manuals/tutorials 
help.start()
help.search("dplyr")
RSiteSearch("dplyr")

# 5. Swirl() also offers interactive R courses. 
#library(swirl)
#swirl()

# 6. Update
sessionInfo()

install.packages("installr")
library(installr)
installr::updateR()

# For RStudio go to help -> check for updates.
# For packages tools -> check for packages updates.

# 7. Some useful shortcuts

# Esc: interrupt current command
# ctrl + s : save
# tab: autocomplete
# Ctrl + Enter : run line
# Ctrl + Shift + C : comment/uncomment
# <- : Alt + - / option + - 
# %>% : ctrl + shift + m (pipe)
# ctrl + l : clear console 
# ctrl + alt + b: run everything up to here.
# Arrows in the console allow me to see the last commands used. 
# Select multiple lines: shift + lines
# Ctrl + f: find/replace 

#--------------------------------#
# C. Object manipulation      ####
#--------------------------------#

#----------------------------------------------------#
## 1. Use R as a calculator / Run commands.       ####
#----------------------------------------------------#

# Separately (select commands + ctrl + Enter)
2+2 
3*5^(1/2)

# Run all instructions 
2+2 ; 3*5^(1/2) 


3+4
5*4
8/4
6^7

6^778

log(10)
log(1)

sqrt(91)

round(7.3)

# Even large operations 
sqrt(91)+4892788*673-(log(4)*round(67893.9181, digits = 2))

# Even the use of imaginary numbers 
2i+5i+sqrt(25i)


#---------------------------------------------------#
## 2. Creating objects: assignments and functions ####
#---------------------------------------------------#

# With the "<-" sign we assign values
# You can also use "=". Not recommended. It confuses.

y=2+4
y

# We can use functions

# Functions are the central part of using R. 
# Some functions come installed in R
# Other functions must be obtained from packages. 
# It is also possible to write your own functions ()
# Functions are generally written in parentheses. E.g. filter(). 
# There are times when functions are related to a specific package. 
# dplyr::filter(). 

# Example 1: simple function 
sqrt(49)

# Example 2: on a dataset

summary(mtcars$mpg)
# Note: mtcars is included in R. 
# To see more: 
data()

# Another function...
z<-c(x,y)
z

# Use of arithmetic functions
mean(z)
median(z)

# Relationships between objects
w <- mean(z)

# Creating objects by assignment 
a <- 3 + 10 
b <- 2*4

# Note that assignments are silent! 
a
b
print(a) # or with print 
print(b)

# Creating objects using functions. 

valores <- c(a,b)
promedio <- mean(valores)
print(promedio)
promedio

# We can write an average here using mean()
a <- 2 
b <- 5
valores1 <- c(a,b)
promedio1 <-mean(valores1)
print(promedio1)

# Clean again 
rm(list = ls())
rm(a)

#-------------------------------------------------------#
## 3. Example 1: creating objects and assignments     ####
#-------------------------------------------------------#

# Important: add spacing in codes. 
# Define two vectors using the c() function
educ <- c(8,12,8,11,16,14,8,10,14,12)
income <- c(325,415,360,380,670,545,350,420,680,465)

# Compute mean, standard deviation, and correlation 

mean(income)
mean_income <- mean(income)

sd(income)
sd_income <- sd(income)

cor(educ, income)
cor_educ_income <- cor(educ,income)

# Plot 
plot(educ, income)

# Estimate a linear regression 
lm(income ~ educ)

#-------------------------------------#
## Exercise 1: naming objects       ####
#-------------------------------------#

# 1. From the following examples, which are valid variable names in R?

# min_height
#max.height
# _age
# .mass
# MaxLength
# Min-length
# 2widths
# Calsius2kelvin


# Answer: 

#1. Valid
min_height<-c(1:3)
MaxLength<-c(1:3)
max.height<-c(1:3)
Calsius2kelvin<-c(1:3)
2widths <-c(1:3)
# Hidden 
.mass <- c(1:3)

# Invalid: the rest, and also anything using special names such as: 
# break ; else; FALSE for function
# if Inf NA NaN next repeat return


#-----------------------#
# D. Types of objects ####                    
#-----------------------#

#------------------#
## 1. Vectors   ####                      
#------------------#

# R works component by component, so it is very 
# easy to work with vectors and matrices. 

#------------------#
# a. Create a vector
#------------------#

# We use the "c()" function
x<-c(1,2,3,4,5)
# or
y<-c(6:8)

# Let's see the vectors  
z<-x+y
z

# Suppose the following vectors: 
x<-c(1:4)
y<-c(1:3)

# What is their length?
length(x)
length(y)

# If they do not have the same length, what will be the result of x+y?
z<-x+y
z

#-------------#
# IMPORTANT!! 
#------------#

# In this case R performs the operation anyway, but tells us 
# there is a warning that their dimensions differ. 
# The relevant point: vectors can only concatenate 
# elements of the same type, otherwise R throws an error

x<-rep(1:9,4) # repeats the values 
y <- c(1:10)

# Subset of a vector
y[3]
y[2:4]
y[4:2]
y[c(2,6)]
y[c(2,16)]


#------------------#
# a. Define matrices  
#------------------#

#my.matrix <- matrix(vector,
 #                  ncol = num_columns, nrow = num_rows,
#                    byrow = logical_value,
 #                   dimnames = list(vector_row_names,
  #                                  vector_col_names))


# To create matrices we use the matrix() function

x <- matrix(data= c(1,2,3,4), 
             nrow=2, 
             ncol=2) 

x1 <- matrix(c(1,2,3,4), nrow=2, ncol=2)

# It is not necessary to write "data=", but mentally it helps.

x
x1

# Note: by DEFAULT it fills column by column. 

# We can specify that we want 
# to fill the matrix row by row 

x<-matrix(c(1:4),2, 2, 
          byrow=FALSE)
x

# We can know the dimension of x

dim(x)
dim(x)[1] # number of rows
dim(x)[2] # number of columns

y<- matrix(c(1,2,3,4), 
           nrow=2,
           ncol=2, 
           byrow=2)
y

# It will repeat them! 
y<- matrix(c(1,2,3,4), nrow=2, ncol=3, byrow=2)
y

# Note that: the order in any matrix is ROWS X COLUMNS

# We can omit the number of rows or columns
y<-matrix(c(1:4) ,2, byrow=TRUE)
y # same result 

# When creating empty matrices you must define dimensions 
y<-matrix(nrow=3, ncol=3)
y # useful for loops

# Name rows and columns
y <- matrix (c(1:4), 2, byrow=TRUE, 
             dimnames=list(c("X1","X2"),c("Y1", "Y2")))
y

# Using colnames and rownames 
colnames(x)<-c("Variable 1", "Variable 2")
rownames(x)<-c("a1", "a2")
x

# Add rows or columns to a matrix 
w<-c(5,6)

#------------------#
# b. Join matrices 
#------------------#
# Join by rows
z<-rbind(x,w)
z 

# It keeps the vector name as the row name 

# Join by columns
z<-cbind(x,w)
z

# What if they have different numbers of rows and/or columns? 
x<-matrix(c(1:9),3)
x
y<-c(5,6)
y

z<-rbind(x,y)
z 

# repeats the vector/observation with shorter length

# Convert a vector into a matrix 

x<-1:10
x

dim(x)<-c(2,5)
x

# Transpose matrices 
x<-matrix(c(1:9),3)
xtranspose <- t(x)

# Many more operations with matrices are possible.

# Subsets of a matrix 
M <- matrix(1:8, nrow=2)
M
M[1,1]
M[1,]
M[,2]
M[2,c(2,4)]

# 2nd and 4th elements of the 2nd row. 

#------------------#
## 3. Arrays    ####                      
#------------------#

# Only difference: accepts more than two dimensions

#my.array <- array(vector, dimensions, dimnames = dim_labels)

# Labels

dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3", "B4")
dim3 <- c("C1", "C2", "C3")

# Define an array of 3 matrices of size 2x4
x <- array(1:24, c(2,4,3), dimnames = list(dim1, dim2, dim3))
# Note the third dimension

# Subset 
x[1,2,3] # 1st row, 2nd col, 3rd matrix
x[,,3]  # full 3rd matrix
x[,4,] # 4th column of all matrices

#------------------#
## 4. Lists     ####                      
#------------------#

# Lists contain elements of different types; matrices, objects, dataframes, vectors, etc. 
x<-list(c(1:8), "R", TRUE, 2+3i, 5L)
x # separates each component

# To access an object inside a list use DOUBLE BRACKETS 
x[[1]]

# Example
x <- list( Degree = c("Economics", "Business", "Business"), 
           Age =c(25,23,27))
x

# When naming components of a list, we can call them 
# without brackets
x$Degree
x$Age

# Since list components have a defined nature, we can also operate on them
x[[2]]*3

# Finally, we can create empty lists
x<-vector("list", length = 2)
x 
# useful to fill loops

#-----------------------------------------#
# E. Access elements of an object      ####
#-----------------------------------------#

#----------#
# Vectors 
#----------#
# To access elements we use brackets []

# Let's see in a vector
x<-c("T", "FALSE", 1:9,1+2i,"t", "c","a",6)
class(x)

# Call an element
x[1]
x[3]

# Extract or use in operations
# But only works with numeric observations

x[1]+x[6] # otherwise R throws an error 
y<-c(1:6, 1+2i)
y[3]+y[7]

# Or visualize x without the first object
x[-1]
# Or delete first object 
x<-x[-1]
x

#----------#
# Matrices
#----------#

# Matrix object selection  
w<-matrix(1:9,3)
w

# 1,1
w[1,1]
# entire first column 
w[,1]
# entire second row
w[2,]
# two columns
w[,1:2]
# all rows except first
w[-1,]

#----------#
# Lists 
#----------#

# Calling an object inside a list 
z<-list(c(1:8), "R", TRUE, 2+3i, 5L)
z # separates each component

# Access with double brackets
z[[1]]

# And something inside that object 
z[[1]][5]

# Check class 
class(z[[1]]) # numeric 

# If numeric, we can do operations 
z[[1]][3]*z[[1]][5]

# ------------------------------------#
## Exercise 4: vectors and matrices ####
# ------------------------------------#

# 1. Create a vector of odd numbers up to 1500. How many elements does it have?

v<-seq(1,1500,2)
v
length(v)

# 2. Matrices

# i. Create a 4x10 matrix with the sequence 1 to 5

x <- matrix(c(1:5), 4,10)

# ii. Create a 10x10 matrix where the diagonal is the value raised 
#     to itself. That is, if you are in row 2, column 2 (2,2)
#     the value on the diagonal is 2 raised to 2.

y <- matrix(NA,10,10)
y[1,1] <- 1*1
y[2,2] <- 2*2
y[3,3] <- 3*3
y[4,4]<-4^4
y[5,5]<-5^5
y[6,6]<-6^6
y[7,7]<-7^7
y[8,8]<-8^8
y[9,9]<-9^9
y[10,10]<-10^10

# iii. Multiply matrices x and y and observe the result. 
z <- x*y
z<- x%*%y

# iv. Join x and y. What is the dimension? 
w <- rbind(x,y)
w
dim(w)

#---------------------------#
# Part 2: Programming tools
#---------------------------#

# ------------------------#
#  Tools in R          ####
# -----------------------#

# --------------#
## 1. Codes  ####
# --------------#
# Some comments about writing code:
# 1. Always comment.
# 2. Always use an index.
#    It allows me to reduce code. 
#    It allows me to see where I am. 
#    I can see it with ctrl + shift + O or below. 

# 3. Split long code into several chunks. Each chunk must have a 
#    clear goal explained in one sentence.
# 4. Write code in blocks. 
# 5. Three basic style tips: 

# use _ to create variables or another convention
# separate objects and operations. 
# write vertically, not horizontally. 

#------------------------------------------------#
## 2. Conditionals and flow control           ####
#------------------------------------------------#

#---------------------#
### a. Operators    ####
#---------------------#

rm(list=ls())

#----------#
# Equality 
#----------#

TRUE == TRUE 
TRUE == FALSE

# To compare elements use double equals "==".  
# Note that you can also assign with "=" (not recommended, better <-)

#----------#
# Inequality (!=)
#----------#

TRUE != FALSE 
"Hello" != "Goodbye"

# Other comparators: <, > (>=), (<=) 

3 < 5
5 > 8
5 >= 5

# Do not confuse with <- which is assignment. 

TRUE > FALSE

# Note: result is logical. 

# In vectors and matrices

vector1 <- c(16,9,13)
vector2 <- c(10,12,15)


# Compare against a scalar
vector1 > 10
vector2 < 10

# Compare each other 
vector1 < vector2

# In a matrix 

matrix <- matrix(c(vector1, vector2), byrow =TRUE, nrow=2)
matrix

matrix > 10

#------------------#
# %in% operator 
#-----------------#

# A very useful operator to compare values 
# and quickly evaluate if a value is inside a 
# vector or dataframe.
rm(list=ls())

v1 <- 3
v2 <- 101
t <- c(1,2,3,4,5,6,7,8)

# Is v1 inside t?
v1 %in% t 

# Another example....

myvector <- c("a", "b", "c", "d")
"a" %in% myvector

# If it is not in the vector, returns FALSE
"h" %in% myvector

# If I want to ask if it is NOT, add ! in front. 
!"a" %in% myvector

# A vector in another vector 
a <- seq(12, 19)
# longer vector:
b <- seq(1, 16)

# test if elements in longer vector is in shorter:
b %in% a

# This will be very useful when we work with datasets. 

#--------------------------------------------------#
# Operators to select subsets of data
#--------------------------------------------------#

y <- c(2,3,3,4,NA,8)
y

# Select only those that are not NA
y1 <- y[!is.na(y)]
y1 

# Note: we used is.na() and negation (!). 

# More details later, but the main idea is here. 

#--------------------------#
### b. Logical operators  ####
#--------------------------#

#--------------------------#
# (&) operator: "and"
#--------------------------#

TRUE & TRUE 
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE 

# Example 

x <- 12 
x>5 & x< 15 

#----------------------------------------------------#
# (|) operator: "or". Non-exclusive conditions.
#----------------------------------------------------#
TRUE  | TRUE 
TRUE  | FALSE 
FALSE | TRUE
FALSE | FALSE 

y <- 4
y < 5 | y > 15 

#------------------------#
# Negation operator (!)
#------------------------#

!TRUE 
!FALSE 

# Combine with functions 

!is.numeric(5)
!is.numeric("Hello")


# Operators with vectors 

c(TRUE, TRUE, FALSE) & c(TRUE, FALSE, FALSE)
c(TRUE, TRUE, FALSE) | c(TRUE, FALSE, FALSE)
!c(TRUE,TRUE,FALSE)

c(TRUE,FALSE,FALSE) && c(TRUE,FALSE,FALSE)

#---------------------#
## 3. Conditionals ####
#---------------------#

#----------#
### a. If ####
#----------#

x <- 3 

#if (condition){

#  anything I want to do 
#  if the condition is true 

#}

if (x > 0){
  
  print("x is a number greater than zero ")
  
}

if (x < 0){
  
  print("x is a number less than zero")
  
}

#-------------#
### b. else ####
#-------------#
x <- 0

if (x>0){
  
  print("x is a positive number")
  
} else{
  
  print("x is a negative number")
  
}

#----------#
### c. elseif ####
#----------#

x <- 0 

if (x>0){
  
  print("x is greater than zero")
  
}else if(x == 0){
  
  print("x is equal to zero")
}else{
  
  print("x is less than zero")
  
}

# (%%): remainder of a division

x <- 6 

if (x %% 2 == 0){
  
  print("x is divisible by 2")
  
} else if (x %% 3 ==0){
  
  print("x is divisible by 3")
} else {
  
  print("x is divisible by neither 2 nor 3")
  
}

# Note: if the first condition is true, the second
# will not run even if it is also true.  

#-------------------#
## 4. Functions  ####
#-------------------#

rm(list=ls())

# Main idea. 

# f(x) = 2x + 1, x in R
# f(x) = "hello" + x , x in ("pepe", "pepa", "maria")

values <-  c(1,2,3,4)
mean(values)

# Additional: args() lets you see arguments of a function 
# without reading documentation. Useful sometimes. 

args(sd) 
args(mean)


# Write functions with one argument

triple <- function(x){
  y <- 3*x
  return(y)
  
}

triple(500)


# Write functions with more than one argument

operation <- function(a,b){
  a*b + a/b
  
  
}

operation(4,2)

# Write functions setting default option.

operation <- function(a,b=1){
  a*b + a/b
  
  
}

operation(4)
operation(4,0)



# Write functions using if and return.

operation <- function(a,b = 1){
  if (b == 0){
    return(0)
    
  }
  a*b + a/b  
  
}

operation(4,0)

# Functions with text 

hello <- function(){
  print("Hello!")
  return(TRUE)
}

hello()

# Default values in both cases
operation <- function(a = 1,b = 1){
  if (b == 0){
    return(0)
    
  }
  a*b + a/b  
  
}

operation()

# To compare elements with each other 
p
library(compare)
vector_trace <- seq(1,10, by = 2)
trace_comparisons <- sample(vector_trace, 3 )

new_function <- function(...)
{
  compare(...)
}


#----------------#
## 5. Iterators ####
#----------------#

#-------------------#
### a. For loop ####
#-------------------#


# Imagine we want to print the names of a vector 
# repeatedly

cities <- c("New York", "Paris", "Santiago", "Rancagua")


print(cities[1])
print(cities[2])
print(cities[3])
print(cities[4])

# We can do the above using an iterator.

for (i in 1:4){
  print(cities[i])
  
}

# Using hidden variables...
for (.j in 1:4){
  print(cities[.j])
  
}

# Or written by naming each element of a vector. 
for(city in cities){
  print(city)
}


# Another example ...
# 
week <- c("Sunday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday")


for (day in week)
{
  print(day)
}

#-------------------------------------#
### b. For loop with options       ####
#-------------------------------------#

cities <- c("New York", "Paris", "Santiago", "Tokyo")

# Add break option

for (city in cities){
  if(nchar(city) == 8){
    break
  }
  print(city)
}

# Add next option 

for (city in cities){
  if (nchar(city) == 8){
    next 
  }
  print(city)
}


#------------------------------#
### c. Make the loop flexible ####
#------------------------------#

cities <- c("New York", "Paris", "Santiago", "Tokyo", "Rancagua")

for (i in 1:length(cities)){
  print(cities[i])
  
}


# Example: to print messages 

for (i in 1:length(cities)){
  print(paste(cities[i], "is in position",i, 
              "in the cities vector"))
}



#--------------------------#
### d. While: while...  ####
#---------------------------#

rm(list=ls())

x<- 1 

while (x<=7){
  print(paste("x is", x))
  # Update 
  x <- x +1 
  
}

while (x<=700){
  print(paste("x is", x))
  # Update 
  x <- x +1 
  
}

# Very important: update! 

# -----------------------------------------#
## Exercise 4: Iterators and functions  ####
# -----------------------------------------#

# I. Write code to do the following: 

# a. Compute the square of the first 10 elements of any vector

# b. Create a 30x30 matrix. For each row and column, assign a value equal to the 
# product of the position. 
# For example, the element in row 2, column 3 has value 6.

# c. Create a function that divides two elements. 
#    Add a message indicating cases where the division is 
#    indeterminate.


#--------------------------#
## 6. lapply, sapply, vapply ####
#--------------------------#
rm(list=ls())

#------------------#
### A. lapply ####
#------------------#


nyc <- list(population = 8405837, neighborhoods = c("Manhattan", "Bronx", "Brooklyn", 
                                                    "Queens", "State Island"))

nyc

#------------------------------------#
#### 1. Loop vs lapply equivalence ####
#------------------------------------#

# I want to know all classes in the list

# With a loop 
for(info in nyc){
  print(class(info))
  
}

# But.... if I use lapply it is much more efficient... 
# lapply: applies like a for loop. 

lapply(nyc,class)

#------------------------------------#
#### 2. lapply result with a vector ####
#------------------------------------#

# lapply runs the function (here class) for every element of the object nyc. 

# If I want number of characters

cities <- c("New york","Paris", "Tokyo", " Rio de Janeiro")
lapply(cities,nchar)

# Note: the result here is a list! If I want a vector, 
# I can use unlist(). 

unlist(lapply(cities,nchar))


#------------------------------------#
#### 3. lapply as a function ####
#------------------------------------#

prices <- list(2.25, 2.18, 2.89, 2.84, 2.89)

# Create a function

multiply <- function(x,factor){
  x * factor
}

# Now, apply lapply and add function options

three_times <- lapply(prices, multiply, factor = 3)
unlist(three_times)

# Note syntax: object, function, options.  
# Same as before, but allowing optional arguments. 


#------------------#
### B. sapply ####
#------------------#

# A variation of lapply used to simplify lapply.
# Now the result is a vector, not a list. 

cities <- c("New york","Paris", "Tokyo", " Rio de Janeiro")
lapply(cities,nchar)
sapply(cities,nchar)

# It is very neat. However, it fails when it is not easy 
# to simplify the result. 

#------------------#
### C. vapply ####
#------------------#
# A variation that lets you explicitly define the output type. 

vapply(cities,nchar, numeric(1))
vapply(cities,nchar, character(1))

#---------------------------------------------------------#
# Data Analysis with R
# Nicolás Campos Bijit 
# Class 3: Data manipulation (Part I)
# Date: January 05, 2022.
#---------------------------------------------------------#

#--------------------------------#
# Programming principles ####
#--------------------------------#

#----------------#
## 1. Iterators  ####
#----------------#
rm(list = ls())
#-------------------#
### a. For loop ####
#-------------------#


#  Imagine we want to display the names of a vector repeatedly

cities <- c("New York", "Paris", "Santiago", "Rancagua")


print(cities[1])
print(cities[2])
print(cities[3])
print(cities[4])

# The above can be done using an iterator.

for (i in 1:4){
  print(cities[i])
  
}

# Using hidden variables...
for (.j in 1:4){
  print(cities[.j])
  
}

# Or written by naming each element of a vector. 
for(city in cities){
  print(city)
}


# Another example ...
# 
week <- c("Sunday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday")


for (day in week)
{
  print(day)
}



#-------------------------------------#
### b. For loop with optionals ####
#-------------------------------------#

cities <- c("New York", "Paris", "Santiago", "Tokyo")

# Add break option: breaks the loop

for (city in cities){
  if(nchar(city) == 8){
    break
  }
  print(city)
}

# Add next option: skips that element

for (city in cities){
  if (nchar(city) == 8){
    next 
  }
  print(city)
}


#------------------------------#
### c. Make the loop flexible ####
#------------------------------#

cities <- c("New York", "Paris", "Santiago", 
            "Tokyo", "Rancagua")

# Now the loop size is flexible. This is very important
# for when we work with datasets. 

for (i in 1:length(cities)){
  print(cities[i])
  
}

# Note that now I call the elements within a loop
# as subsets of a vector. 

# Example: to leave messages 

for (i in 1:length(cities)){
  print(paste(cities[i], "is in position", i, 
              "in the cities vector"))
}

# The above is applicable for inspections of 
# datasets; for example, we can leave a
# message

for (i in 1:length(mtcars)){
  print(paste("the average of the variable",
              names(mtcars[i]), "is",
              mean(mtcars[,i])))
}

#----------------------------------#
### d. While: while.... ####
#----------------------------------#

rm(list=ls())

x <- 1 

while (x <= 7){
  print(paste("x is", x))
  # Update 
  x <- x +1 
  
}

while (x <= 700){
  print(paste("x is", x))
  # Update 
  x <- x +1 
  
}

# The update is very important! 


#--------------------------#
## 6. lapply, supply, vapply ####
#--------------------------#
rm(list=ls())

#------------------#
### A. Lapply ####
#------------------#

nyc <- list(population = 8405837, 
            boroughs = c("Manhattan", "Bronx", 
                         "Brooklyn", "Queens", 
                         "State Island"))

nyc

#------------------------------------#
#### 1. Equivalence between loop and lapply ####
#------------------------------------#

# I want to know all the classes in the list

# I can do this with a loop 
for(info in nyc){
  print(class(info))
  
}

# But.... if I use lapply I can do it much 
# more efficiently...
# Lapply: applies this as if it were a for loop. 

lapply(nyc, class)

#------------------------------------#
#### 2. lapply output as a vector ####
#------------------------------------#

# lapply runs the function, in this case class, for every element of the object,
# in this case nyc. 

# If I want to know the number of characters

cities <- c("New york","Paris", "Tokyo", " Rio de Janeiro")
lapply(cities, nchar)

for (city in cities){
  print(nchar(city))
  
}

# Note that the result here is a list!
# If I want it to be a vector, 
# I can use the unlist() function. 

unlist(lapply(cities, nchar))


#------------------------------------#
#### 3. lapply with a function ####
#------------------------------------#

prices <- list(2.25, 2.18, 2.89, 2.84, 2.89)

# We create a function

multiply <- function(x, factor){
  x * factor
}

# Now, we can apply lapply and add
# function options

three_times <- lapply(prices, multiply, factor = 3)
unlist(three_times)

# Note the syntax is: object, function, options.
# That is, same as before, but allowing
# optionals. 

#------------------#
### B. sapply ####
#------------------#

# It is a variation of "lapply" that simplifies
# "lapply"
# Now the result is a vector, not a list. 

cities <- c("New york","Paris", "Tokyo", " Rio de Janeiro")
lapply(cities, nchar)
sapply(cities, nchar)

# Note that it is quite tidy. However, it fails when it is not easy
# to simplify the output. 

#------------------#
### C. vapply ####
#------------------#
# It is a variation that helps define explicitly the type of the
# output object. 

vapply(cities, nchar, numeric(1))

#---------------------------------------------------------#
# Data Analysis with R
# Nicolás Campos Bijit 
# Class 3: Data manipulation (Part I)
# Date: January 05, 2022.
#---------------------------------------------------------#

#--------------------------------#
# Programming principles ####
#--------------------------------#

#----------------#
## 1. Iterators  ####
#----------------#
rm(list = ls())
#-------------------#
### a. For loop ####
#-------------------#


#  Imagine we want to display the names in a vector repeatedly

cities <- c("New York", "Paris", "Santiago", "Rancagua")


print(cities[1])
print(cities[2])
print(cities[3])
print(cities[4])

# The above can be done using an iterator.

for (i in 1:4){
  print(cities[i])
  
}

# Using hidden variables...
for (.j in 1:4){
  print(cities[.j])
  
}

# Or written by indicating the name of each element in a vector.
for(city in cities){
  print(city)
}


# Another example ...
# 
week <- c("Sunday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Saturday")


for (day in week)
{
  print(day)
}



#-------------------------------------#
### b. For loop with options ####
#-------------------------------------#

cities <- c("New York", "Paris", "Santiago", "Tokyo")

# Add break option: breaks the loop

for (city in cities){
  if(nchar(city) == 8){
    break
  }
  print(city)
}

# Add next option: skips that element

for (city in cities){
  if (nchar(city) == 8){
    next 
  }
  print(city)
}


#------------------------------#
### c. Make the loop flexible ####
#------------------------------#

cities <- c("New York", "Paris", "Santiago", 
            "Tokyo", "Rancagua")

# Now the loop size is flexible. This is very important
# when we work with datasets. 

for (i in 1:length(cities)){
  print(cities[i])
  
}

# Notice that now I call elements inside a loop
# as subsets of a vector. 

# Example: leaving messages 

for (i in 1:length(cities)){
  print(paste(cities[i], "is in position", i, 
              "in the vector cities"))
}

# The above is applicable for dataset inspections, for example,
# we can leave a message

for (i in 1:length(mtcars)){
  print(paste("the average of the variable",
              names(mtcars[i]), "is",
              mean(mtcars[,i])))
}

#----------------------------------#
### d. While: while.... ####
#----------------------------------#

rm(list=ls())

x <- 1 

while (x <= 7){
  print(paste("x is", x))
  # Update 
  x <- x + 1 
  
}

while (x <= 700){
  print(paste("x is", x))
  # Update 
  x <- x + 1 
  
}

# The update is very important! 


#--------------------------#
## 6. lapply, sapply, vapply ####
#--------------------------#
rm(list=ls())

#------------------#
### A. lapply ####
#------------------#

nyc <- list(population = 8405837, 
            boroughs = c("Manhattan", "Bronx", 
                         "Brooklyn", "Queens", 
                         "State Island"))

nyc

#------------------------------------#
#### 1. Loop vs. lapply equivalence ####
#------------------------------------#

# I want to know all the classes in the list

# I can do this with a loop 
for(info in nyc){
  print(class(info))
  
}

# But.... if I use lapply I can do it much more efficiently...
# lapply: applies this as if it were a for loop. 

lapply(nyc, class)

#------------------------------------#
#### 2. lapply result with a vector ####
#------------------------------------#

# lapply runs the function, in this case class, on every element of the object,
# in this case nyc. 

# If I want to know the number of characters

cities <- c("New york","Paris", "Tokyo", " Rio de Janeiro")
lapply(cities, nchar)

for (city in cities){
  print(nchar(city))
  
}

# Notice the result here is a list!
# If I want it to be a vector,
# I can use the unlist() function. 

unlist(lapply(cities, nchar))


#------------------------------------#
#### 3. lapply with a custom function ####
#------------------------------------#

prices <- list(2.25, 2.18, 2.89, 2.84, 2.89)

# Create a function

multiply <- function(x, factor){
  x * factor
}

# Now we can apply lapply and add
# function options

three_times <- lapply(prices, multiply, factor = 3)
unlist(three_times)

# Notice the syntax is: object, function, options.
# That is, same as above, but allowing
# optional arguments. 


#------------------#
### B. sapply ####
#------------------#

# This is a variation of "lapply" that simplifies
# "lapply"
# Now the result is a vector, not a list. 

cities <- c("New york","Paris", "Tokyo", " Rio de Janeiro")
lapply(cities, nchar)
sapply(cities, nchar)

# Notice it is quite tidy. However, it fails when it is not easy
# to simplify the result. 

#------------------#
### C. vapply ####
#------------------#
# This variation lets you explicitly define the object type of the output. 

vapply(cities, nchar, numeric(1))

# ------------------------------------#
# Data manipulation in R
#-------------------------------------#
rm(list = ls())
# -------------#
# Introduction
#--------------#

# Data analysis is an important part of the tasks we want to perform
# when using R. 

# We will review four initial aspects of any data work: 

# 1. Import data in different formats.
# 2. Inspect and clean the data we have.
# 3. Transform data in order to create new variables.
# 4. Join datasets of different types

#--------------------------------#
# A. Import datasets ####                      
#--------------------------------#

#  1. To use, load, and update data, it is important to keep everything
#  in one place. 

#  2. This also applies to results and code. 

#  3. For this to actually happen we need to tell R what our working directory will be,
#     i.e., the place where we will store the data we want to work with, the results
#     of our analysis, and our code. 

#------------------------------------#
## A.1 Working directories in R ####                      
#------------------------------------#

# Tells me where I am 
getwd()

# If I want to set another path I have two options: 

# Option 1: Tell R the path/folder where my data are
setwd("my_path_here")

# Option 2: Same as option 1, but cleaner.
path <- "path_here"
setwd(path)


# Note that it is necessary to use "/". By default, when you copy paths
# they may come with a different type of "slash". 

# To change them easily (and not one by one), we will
# use ctrl + f. 

# With this shortcut we can replace multiple elements at once.
# Careful!! It is important to specify whether we want to change the whole
# document or only part of it. 

dir(path)

#----------------------------#
# Example: organizing folders
#----------------------------#

# Code 
code <- "C:/Users/nicol/Dropbox/Nicolas/Courses/R Course/R Course - 2021/Class 2/project-class2/code"
code <- paste(path, "/", "code", sep = "")
setwd(code)
dir(code)

# Data 
data <- "C:/Users/nicol/Dropbox/Nicolas/Courses/R Course/R Course - 2021/Class 2/project-class2/data"
data <- paste(path, "/", "data", sep = "")
dir(data)

# Raw data 
dataraw <- "C:/Users/nicol/Dropbox/Nicolas/Courses/R Course/R Course - 2021/Class 2/project-class2/data/raw"
dir(dataraw)

# The above is not highly recommended. 

#-------------------------#
## A.2 R Projects ####
#-------------------------#

#--------------#
## A.3 Package here ####
#--------------#
pacman::p_load(here)

here()

#----------------#
## A.4 Package rio ####                      
#---------------#

# R has built-in datasets.
# However, many times you will want to work with your own data,
# or with public data that often come in different formats. 

# When a "dataset" is imported into R, it usually
# creates a new data frame object in the R environment, defined as an imported file
# (e.g., Excel, CSV, TSV, RDS) located in the folder directories
# at a given file path.


# The rio package is a flexible way to import data.
# rio stands for R input/output.
# Two main functions: import() and export().
# Also, when you provide an extension to rio, it will read it
# and use the appropriate tool to import those data. 

# There are other options to import data too.
# E.g., read.csv() ("base R"); read.xlsx ("openxlsx")
# The problem is they are hard to remember. Better to use one. 

library(pacman)
library(here)
p_load(here)
p_load(rio)



#-----------------------------------------#
## A.5 Import data in different formats ####                      
#-----------------------------------------#

# Using import() to import a dataset is
# quite simple: you just provide the file path
# (including the file name and extension) in quotes.

# (incldatos_dta  <- import(here("data", "Data.dta"))
data_txt  <- import(here("data", "Data.txt"))
data_csv  <- import(here("data", "Data.csv"))

# We use R Project, here, and import to import data
# easily...

data_xlsx <- import(here("data", "Data.xlsx"))

# ---------#
# Options #
# ---------#

# 1. Import different sheets

# By default, it imports the first sheet of an Excel file.
# With "which" I can choose the sheet

data_xlsx <- import(here("data", "Data.xlsx"), which = "sheet1") 
data_xlsx <- import(here("data", "Data.xlsx"), which = "sheet2") 

# 2. I can specify in advance which values are missing.

# Specify one missing value
data_xlsx <- import(here("data", "Data.xlsx"), na = "2018") 

# Specify multiple at once..
data_xlsx <- import(here("data", "Data.xlsx"), 
                    na = c("Missing", "", " "))

# 3. Skip rows

data_xlsx <- import(here("data", "Data.xlsx"), skip = 1)

# Notice I can do this with any data type,
# since these are rio options.

data_dta  <- import(here("data", "Data.dta"), skip = 1)

# In the table at this link you can see the different packages
# supported by rio, along with additional examples.
browseURL("https://cran.r-project.org/web/packages/rio/vignettes/rio.html") 

#-------------------------------------------------------------#
# C. Inspect, clean, and transform a dataset ####                      
#-------------------------------------------------------------#

# We already know how to load data.
# Now we will do the first process to analyze
# any dataset.

#-------------------------#
## C.1 Key functions  ####                      
#-------------------------#

# Tidyverse is a collection of R packages.
# Tidyverse includes multiple packages we will use.
# It includes: dplyr, ggplot2, tidyr, stringr, tibble, purrr,
#           magrittr, and forcats.

# A key package is dplyr, which contains many functions
# to work with datasets.
# Install tidyverse:

# install.packages("tidyverse")
p_load(tidyverse)

# Let's look at the Excel file with some key functions...


#----------------#
## C.2 Piping operator ####
#----------------#

# Piping (%>%): ctrl + shift + m
# Associated package: magrittr

# 1. Operator that allows chaining functions
#    to easily perform complex transformations in datasets
# 2. It passes the element on its left as an argument to the function on the right.
#    It emphasizes actions. It passes an intermediate output from one function to the next.
# 3. magrittr is the package that enables piping.
#    Piping is widely used with tidyverse and dplyr libraries focused on data analysis.
# 4. Excellent when there is a sequence of actions/operations we want to perform.


## Example 1: use pipe as a chaining operator

data("iris")
head(iris, n = 4)
iris %>% head(. , n = 4)
iris %>% head(n = 4) 

# Example 2: get total number of observations and a mean.
mtcars %>%
  summarise(mean = mean(disp), n = n())


#----------------------------------------------------------------------#
## C.3 Data analysis process: load, inspect, and clean ####                      
#----------------------------------------------------------------------#

# 1. Load packages we will use
pacman::p_load(
  rio,        # importing data  
  here,       # relative file pathways  
  janitor,    # data cleaning and tables
  lubridate,  # working with dates
  tidyverse,  # data management and visualization
  magrittr
)

# 2. Import data
data <- import(here("data", "Data.xlsx"), which = "sheet1") 

#--------------#
# Inspect #
#--------------#

# 1. General view 

skimr:: skim(data)
str(data)

# The skim function from the skimr package allows us to see the whole
# dataframe and observe some characteristics

# 2. Look at some rows, columns, etc.

head(data) # shows the first 6 rows 
tail(data) # last 6 rows 
head(data, 11) # we can ask for more than 6 
tail(data, 3) # or fewer than 6

# 3. View variable/column names
names(data)

# or change them
names(data) <- c("YEAR", "GDP", "GROSS_EXPORTS", 
                 "GROSS_IMPORTS", "NET_EXPORTS")
names(data)

# 4. View row names
row.names(data)

# 5. Check number of variables/dimensions
length(data)
dim(data)
ncol(data)
nrow(data)

# Recall this is a data frame
class(data)


# We can also inspect specific things

# If we want to view the GDP column
data$gdp
data[2]
gdp

# If we want an element within a variable
data$gdp[7]
data[7,2] #[row, column]

# If we want to select part of the column
data$gdp[1:2]
# or
gdp[1:2]
# or 
data[1:2,2]

# If we want a simple frequency table for a variable
table(data$year)

# ---------------------------------#
# Clean column names automatically #
# ---------------------------------#

# The clean_names() function from janitor standardizes names:
# It converts all names so they contain only underscores,
# numbers, and letters.
# The ñ becomes n.

data_new <- clean_names(data)


# -------------------#
# Rename variables #
# -------------------#

# Syntax:
# rename(newname = oldname)

# Using piping to rename.

data_renamed <- data_new %>% 
  rename(time = year,
         gdp = gdp, 
         exports = gross_exports)

data_renamed
names(data_renamed)


# ----------------------#
# Select columns
# ---------------------#

rm(list= ls())
data <- import(here("data", "Data.xlsx"), which = "sheet1") 


# select() from dplyr allows selecting variables

data_select <- data %>% 
  select(year, gdp)  

names(data_select)

# I can also select based on a criterion

data_select2 <- data %>% 
  select(contains("gross"))

# With select we can also rename

data_select <- data %>% 
  select(year = year, gdp = gdp)  

# -----------------#
# Reorder columns
# -----------------#

# One option is to use select with everything()
data_select_ordered <- data %>% 
  select(gdp, year, everything()) 

# -----------------#
# Remove columns
# -----------------#

# The idea here is: keep all except the ones listed.
data_select_remove <- data %>% 
  select(-c(gdp, year)) 


# -----------------------#
# Check for duplicates
# -----------------------#

# Sometimes it is important to check for duplicates.
# The dplyr package contains the distinct() function. This function
# examines each row and reduces the data only to those with distinct values.

data1 <- data %>% 
  distinct()

nrow(data)
nrow(data1)

dif <- nrow(data) - nrow(data1) 
dif

#------------------------------------#
## C.4 Data analysis process:
#------------------------------------#
#-----------------------#
# I. Create variables ####                      
#-----------------------#

#-------#
# Mutate
#-------#

rm(list= ls())
data <- import(here("data", "Data.xlsx"), which = "sheet1") 

# Definition: changes or adds variables.
# We use mutate() from dplyr.
# Let's modify a variable

data %>% 
  mutate(gdp = gdp/1000000)

data

# Create a new variable

# It is not created in the dataset unless we overwrite
data %>%  
  mutate(exports_ratio = gross_exports/gdp) 

# We must overwrite.
data <- data %>%  
  mutate(exports_ratio = gross_exports/gdp) 

# Combine mutate with other verbs
data1 <- data %>% 
  select(year, gdp, gross_exports) %>% 
  mutate(ratio = gross_exports/gdp,
         ratio_percent = ratio*100, 
         gdp = as.numeric(gdp))

# Notice we also converted the class of a column!

#---------#
# Group by
#---------#

# We can compute statistics by group

data1 <- data %>% 
  group_by(year) %>% 
  
  # For all columns
  
  data %>% 
  mutate(gdp_mean = gdp/ mean(gdp, na.rm = TRUE))

# By year
data %>% 
  group_by(year) %>% 
  mutate(gdp_mean = gdp/ mean(gdp, na.rm = TRUE))


#-------------------------#
# Create binary variables
#-------------------------#
rm(list= ls())
data <- import(here("data", "Data.xlsx"), which = "sheet1") 


# 1 if we are in democracy, 0 otherwise
data$demo <- ifelse(data$year > 1990, 1, 0)

# To see a simple table of the variable
table(data$demo)

# 1 if we are in democracy and GDP is above its mean
data$progress <- ifelse(data$demo == 1 & data$gdp > mean(data$gdp), 1, 0)
table(data$progress)

# 1 if we are in democracy and, within those periods,
# gross exports are greater than the median of gross imports
data$expo <- ifelse(data$demo == 1,
                    ifelse(data$gross_exports > median(data$gross_imports), 1, 0),
                    0)
table(data$expo)

#--------------------------#
# Create continuous variables
#--------------------------#

data$gdp_2 <- data$gdp*data$gdp
data$log_gross_exports <- log(data$gross_exports)

# If we want a ratio
data$export_gdp <- data$gross_exports/data$gdp

# Another option is to use mutate()

data <- data %>%  
  mutate(exports_ratio = gross_exports/gdp) 


# Example order
data2 <- data4[order(data4$year),]
data3 <- data[order(data$year,data$gdp),]
data4 <- data[order(data$export_gdp),]

# If we want to create GDP growth, we need lags
library(Hmisc)
data$gdp_lag <- Lag(data$gdp, 1)

# Create the variable and plot
data$growth <- ((data$gdp/data$gdp_lag) - 1) * 100
summary(data$growth)
plot(data$year, data$growth)

#---------------------#
# Categorical variables
#---------------------#

# Very simply, we can generate variables based on conditions
data$type <- ifelse(data$year < 1980 & data$year > 1959, 1,
                    ifelse(data$year < 2000 & data$year > 1979, 2,
                           ifelse(data$year < 2010 & data$year > 1999, 3, 4)
                    )
)
table(data$type)


#--------------------------#
# Other uses of dplyr ####
#--------------------------#

# 1. select rows: filter()
# 2. reorder rows: arrange()
# 3. compute descriptive statistics: summarise()

# In general these are functions we have used in different ways before,
# but with this package they are done easily.

#-----------------#
# 1. Filter() ####
#-----------------#

# Select only Chile's GDP
chile <- data %>% 
  filter(year == 1967)
chile

# Only GDP between certain dates
data1 <- data %>% 
  filter(year > 1990 & year < 2010) 
year

# Or more complex conditions
cond <- data %>% 
  filter(year > 1990 & gdp > mean(gdp))
cond


#--------------------#
## 3. Summarise() ####
#--------------------#
data %>% 
  summarise(mean = mean(year)) # does not count when there are NA  

data %>% 
  filter(year == 2010) %>% 
  summarise(mean = mean(gdp), max = max(gdp)) 


#------------------------------#
# D. Join datasets ####                      
#------------------------------#

rm(list=ls())


# 1. Bind columns. The equivalent in Stata would be "merge"
# 2. Bind rows. "Append"

# Today's example: hospital data.

hosp_info <- read.xlsx("Data/hosp_info_final.xlsx")
linelist_mini <- read.xlsx("Data/linelist_mini_final.xlsx")

#---------#
# Syntax
#---------#


# Imagine we have two datasets "df1", "df2".
# df1 has a column called "ID".
# df2 has a column called "identifier".

# Case 1: different identifier names.
data_joined <- left_join(df1, df2, by = c("ID" = "identifier"))

# Case 2: imagine both datasets (df1, df2) have an identifier called "ID"

data_joined <- left_join(df1, df2, by = "ID")


# Case 3: imagine we want to join datasets using more than one identifier.

data_joined <- left_join(df1, df2, by = c("name" = "firstname",
                                          "lastname" = "firstlastname",
                                          "Age" = "age"))


#------------------#
# Left and Right join
#------------------#

# Left join: the first dataset listed is the reference.
# Right join: the second dataset listed is the reference.


# Left_join

left_join_ex1 <- left_join(linelist_mini, 
                           hosp_info, 
                           by = c("hospital" = "hosp_name"))


right_join_ex1 <- right_join(hosp_info, 
                             linelist_mini,
                             by = c("hosp_name" = "hospital"))



right_join_ex2 <- right_join(linelist_mini, hosp_info,
                             by = c("hospital" = "hosp_name"))




left_join_ex1 <- linelist_mini %>% 
  left_join(hosp_info, 
            by = c("hospital" = "hosp_name"))



# Notes:

# 1. All rows/observations from the reference dataset are kept.
# 2. If there is more than one match, observations are duplicated.
# 3. Identifiers are combined, using the column name
#    from the reference dataset.
# 4. When there is no match, columns are filled with NA
#    for observations in the reference dataset.
# 5. Non-matches from the non-reference dataset are dropped.


#---------#
# Full Join
#---------#

# The most inclusive join. Returns all observations/rows.

full_join_ex3 <- full_join(linelist_mini, 
                           hosp_info, 
                           by = c("hospital" = "hosp_name"))


full_join_ex3 <- linelist_mini %>% 
  full_join(hosp_info, 
            by = c("hospital" = "hosp_name"))



#---------#
# Inner join
#---------#

# The most restrictive join
# Returns only rows that matched between both datasets.
# Stata: merge 1:1, keep _merge==3
# Perfect matches between both datasets.

inner_join_example <- linelist_mini %>% 
  inner_join(hosp_info, 
             by = c("hospital" = "hosp_name"))  



#------------#
# Semi-join
#------------#

# Keeps all observations in the reference dataset that have a match
# in the secondary dataset, but does NOT add new columns nor duplicates
# in cases of multiple matches.

semi_join_example <- hosp_info %>% 
  semi_join(linelist_mini, 
            by = c("hosp_name" = "hospital"))  


#------------#
# Anti-join
#------------#

# Like semi-join, it is a "filter join".
# Returns observations/rows in the reference dataset
# that do not match in the secondary dataset.

anti_join_example <- hosp_info %>% 
  anti_join(linelist_mini,
            by = c("hosp_name" = "hospital"))

