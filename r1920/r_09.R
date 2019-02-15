#### 결측치(NA) : missingvalue, 누락된 값, 비어있는 값 ####
df <- data.frame(sex = c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))
df
is.na(df)         # 결측치 TRUE / 결측치아닌 값 FALSE
!is.na(df)
dim(df)
table(df)
table(df$sex)
table(df$score)
table(is.na(df))          # 결측치 빈도 확인
table(is.na(df$sex))
table(is.na(df$score))
mean(df$score)            # (결과)[1] NA
sum(df$score)
library(dplyr)
df
is.na(df$score)
df %>% filter(is.na(score)) 
df %>% filter(!is.na(score))  # ! : NOT
df %>% 
  filter(!is.na(score)) %>% 
  summarise(mean(score))
df %>% 
  summarise(mean(score))  
df %>% filter(is.na(sex))
df %>% filter(!is.na(sex))
df

df_nomiss <- df %>% filter(!is.na(score))

df_nomiss
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df_nomiss %>% filter(!is.na(sex))


df_nomiss <- df %>% filter(!is.na(df$sex) & !is.na(df$score))
df_nomiss <- df %>% filter(!is.na(sex) & !is.na(score))
df_nomiss   

# 결측치가 하나라도 있으면 모두 제거 : na.omit()####
df_nomiss2 <- na.omit(df) 
df_nomiss2
df

# 함수의 결측치 제외 ####
sum(df$score)
sum(df$score, na.rm = FALSE)  # NA

sum(df$score, na.rm = TRUE)   # 16

mean(df$score)
mean(df$score, na.rm = TRUE)  # 16/4  (result)4 

exam <- read.csv("csv_exam.csv")  # 데이터 불러오기(결측치 없음)
exam <- as.data.frame(exam)
exam
exam[c(3,8,15), "math"] <- NA 

View(exam)
exam %>% summarise(mean_math = mean(math))


exam %>% summarise(mean_math = mean(math, na.rm = TRUE),
                   sum_math = sum(math, na.rm = TRUE),
                   median_math = median(math, na.rm = TRUE))

# 결측치 대체하기 (대체값을 평균값(55)으로)
mean(exam$math, na.rm = TRUE)
exam$math <- ifelse(is.na(exam$math), 55, exam$math) 
View(exam)

table(is.na(exam$math))

exam  
mean(exam$math)




