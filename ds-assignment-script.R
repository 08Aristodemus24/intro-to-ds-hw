library(dplyr)

# load and display college data frame
college_df <- read.csv('college_students_w_header - college_students_w_header.csv', header=T)
print(college_df)
print(length(college_df))
# remove entries that have no surname and first name
# note that "&" is logical operator "&&" but for vectors
# to access column use $<column name> succeeding the name
# of the data frame to be used
college_df <- college_df[!is.na(college_df$Surname) & !is.na(college_df$First.Name),]

# print number of rows with students not taking HW 2
# print their surname and first name
nrow(college_df[is.na(college_df$HW.2),])
hw2_absentee <- college_df[is.na(college_df$HW.2),]
print(select(hw2_absentee, Surname, First.Name))

# print number of students who did not take exam 2
# and print their surname and first name
print(nrow(college_df[is.na(college_df$Exam.2),]))
exam2_absentee <- college_df[is.na(college_df$Exam.2),]
print(select(exam2_absentee, Surname, First.Name))

# print columns for concatenation
print(college_df$First.Name)
print(college_df$Surname)

# concatenate columns first name and surname
# then print the vector returned by paste()
full_name <- paste(college_df$First.Name, college_df$Surname)
print(full_name)

# create a new column and assign full_name
# display new data frame
college_df['Full name'] <- full_name
print(college_df)

# display rows of hw3 that are >= 97
goe_97_rows <- college_df['HW.3'] >= 97
print(goe_97_rows)

# college_df$HW.3[goe_97_rows] <- 0
# college_df$HW.3[!goe_97_rows] <- 100
# print(college_df)

# write a callback function for apply to
# modify rows in a column that is >= 97
cheaters_to_zero <- function(hw3_x){
  print(hw3_x)
  return (if(hw3_x >= 97) 0 else 100)
}

# use callback in apply and use its result to
# modify the HW.3 column in college_df
college_df$HW.3 <- sapply(college_df$HW.3, cheaters_to_zero)
print(college_df)

# write another callback for apply to
# modify rows in a column that is NA
resolve_missed <- function(col_i){
  return (if(is.na(col_i)) 0 else col_i)
}

# use callback in columns HW.2 and Exam.2 use resulting
# vectors to modify HW.2 and Exam.2 in college_df
# note: use sapply since it returns individual values 
# like ints and numerics instead of a list
college_df$HW.2 <- sapply(college_df$HW.2, resolve_missed)
college_df$Exam.2 <- sapply(college_df$Exam.2, resolve_missed)
print(college_df)

# check the data type of each column of college_df
sapply(college_df, class)

# create new columns HW Mean and Exam Mean that 
# represent the mean of columns HW1, HW2, and 
# HW3 and Exam1, and Exam2 respectively
# select all the rows of college_df but constraining 
# the columns to only hw1, hw2, and hw3
print(rowMeans(college_df[, c("HW.1", "HW.2", "HW.3")], na.rm=TRUE))
college_df['HW.Mean'] <- rowMeans(college_df[, c("HW.1", "HW.2", "HW.3")], na.rm=TRUE)

print(rowMeans(college_df[, c("Exam.1", "Exam.2")], na.rm=TRUE))
college_df['Exam.Mean'] <- rowMeans(college_df[, c("Exam.1", "Exam.2")], na.rm=TRUE)

# write a callback to compute the final grade using the 
# values of each column in each row of the dataset
compute_final_grade <- function(x){
  # since x is a vector access it via ['<column name']
  # using array notation/indexing
  print(x)
  
  # get 30% of hw mean
  print(x)
  print(length(x))
  print(nrow(x))
  # get 30% of long exams
  
  
  # get 40% of final exam
  
}

# use the callback in apply (instead of sapply) and 
# use its return value for new column FG Per in college_df
apply(select(college_df, HW.Mean, Exam.Mean, Final.Exam), 1, compute_final_grade)
