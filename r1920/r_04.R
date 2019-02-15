exam <- read.csv("csv_exam.csv")

head(exam)
head(exam, 10)
tail(exam)
tail(exam, 3)
View(exam)
dim(exam)
str(exam)
summary(exam)
install.packages("ggplot2")
library(ggplot2)
str(mpg)
?mpg
summary(mpg)
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw
df_new <- df_raw
df_raw


install.packages("dplyr")
library(dplyr)
df_new <- rename(df_new, v2 = var2)
df_new
library(ggplot2)
str(mpg)
dim(mpg)
colnames(mpg)
mpg1 <- mpg
colnames(mpg1)


mpg1 <- rename(mpg1, city = cty)
mpg1 <- rename(mpg1, highway = hwy)

df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))

df
df$var_sum <- df$var1 + df$var2
df

df$var_mean <- (df$var1 + df$var2)/2
df$var_mean <- df$var_sum/2
df

# 통합 연비 
mpg1
colnames(mpg1)
mpg1$total <- (mpg1$city+mpg1$highway)/2
mean(mpg1$total)
colnames(mpg1)

summary(mpg1$total)
hist(mpg1$total)   # 기준값 : 20
View(mpg1)

mpg1$test <- ifelse(mpg1$total>=20, "pass", "fail")

mpg1$test <- ifelse(mpg1$total<20, "fail", "pass")
table(mpg1$test)  # 빈도표 확인

dim(mpg1)
qplot(mpg1$test)

mpg1$grade <- ifelse(mpg1$total>= 30, "A",
                     ifelse(mpg1$total>=20,"B","C"))
head(mpg1)
View(mpg1)


midwest
dim(midwest)
colnames(midwest)
#문제1) poptotal ==> total
# popasian ==> asian
head(midwest , 10)
View(midwest)
midwest$asian_ratio <-
  (midwest$popasian/ midwest$poptotal *100)
View(midwest)

midwest$asian_ratio_mean <-
  ifelse(midwest$asian_ratio >= mean(midwest$asian_ratio) ,
         "large" , "small")

View(midwest)
qplot(midwest$asian_ratio_mean)


