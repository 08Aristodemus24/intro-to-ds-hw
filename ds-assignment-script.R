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
# print(college_df)

cheaters_to_zero <- function(hw3_x){
  print(hw3_x)
  return (if(hw3_x >= 97) 0 else 100)
}

college_df$HW.3 <- lapply(college_df$HW.3, cheaters_to_zero)
print(college_df)


