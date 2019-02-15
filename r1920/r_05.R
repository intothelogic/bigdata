library(dplyr)
exam <- read.csv("csv_exam.csv")
exam
dim(exam)
View(exam)

# 조건에 맞는 데이터만 추출 : 행추출 filter() ####

exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
colnames(exam)
exam %>% filter(class == 1 & math >=50)
exam %>% filter(class == 1 | math >=50)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))
class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)

mean(class1$math)

mean(class2$english)
# 필요한 변수 데이터만 추출 : 열추출 select() ####
exam %>% select(math)
exam %>% select(class, math, english)

exam %>% select(-math)

exam %>% select(-math, -english)

exam %>% filter(class == 1) %>% select(english)
exam %>% 
  filter(class == 1) %>%
  select(english)

exam %>%
  select(id, math) %>%
  head

exam %>%
  select(id, math) %>%
  head(10)

exam %>% arrange(math)        # 오름차순
exam %>% arrange(desc(math))  # 내림차순
exam %>% arrange(class) 
exam %>% arrange(class, math) # 1차정렬, 2차정렬
exam %>% arrange(class, desc(math)) 
