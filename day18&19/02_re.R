
library(ggplot2)
library(dplyr)
library(readxl)


# 결측치(NA): Missingvalue, 누각된 값, 비어있는 값 ###

df <- data.frame(sex = c("M","F",NA,"M","F"),
                 score = c(5,5,4,3,NA))

df

mean(df$score) #[1] NA

is.na(df) # 결측치 존재여부
!is.na(df)

dim(df)
table(df)
table(df$sex)
table(df$score)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

sum(df$score) # [1] NA

# 결론! 결측치를 전부 제거해야한다.

df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df %>%
  filter(!is.na(score)) %>%
  summarise(mean(score))


df %>% filter(is.na(sex))
df %>% filter(!is.na(sex))
df_nomiss <- df %>% filter(!is.na(score))
df_nomiss


df_nomiss <- df_nomiss %>%
  filter(!is.na(sex))

df_nomiss
mean(df_nomiss$score)

# =======결측치 제거함수 na.onit() =======
df_nomiss2 <- na.omit(df)
df_nomiss2

#==================================================

exam <-  read_excel("excel_exam.xlsx")
exam
exam[c(3,8,15), "math" ] <- NA
exam[c(1,6,8),"english"] <- NA
View(exam)

# 문제1) 수학이 결측치인 데이터를 제외하고 
# df 다시 세팅


exam2 <- na.omit(exam)
exam2

exam %>% filter(!is.na(math)) %>%
  filter(!is.na(english))

# 결측치 대체하기 ( 대체값을 평균값(55)으로 )

a <- mean(exam$math, na.rm = TRUE) # na.rm <-  함수로 결측치 제거 제공
a <- as.integer(a)  # 실수(소수점이 있는 수 )를 정수(소수점이 없는 수 )로 변환
a

exam$math <- ifelse(is.na(exam$math),
                    a,
                    exam$math )

View(exam)


b <- mean(exam$english, na.rm =TRUE)
b <- as.integer(b)
b

exam$english <- ifelse(is.na(exam$english),
                       b,
                       exam$english)
View(exam)


# 결측치는 제거하고 계산하거나 대체를 통해서 계산한다.

