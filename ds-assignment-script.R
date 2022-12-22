library(dplyr)

college_df <- read.csv('college_students_w_header - college_students_w_header.csv', header=T)

print(college_df)

print(select(college_df, Surname))

print(select(college_df, First.Name))

print(college_df$Surname)

print(paste(college_df$Surname, college_df$First.Name))

full_name <- paste(college_df$First.Name, college_df$Surname)
college_df['Full name'] <- full_name
print(college_df)

print(college_df['HW.3'])

