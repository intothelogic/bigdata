# install.packages("ggplot2")
# install.packages("dplyr")
# install.packages("readxl")


library(ggplot2)
library(dplyr)
library(readxl)

exam <- read_excel("excel_exam.xlsx")
exam

exam <- exam %>%
  mutate(total = math + english + science)

exam

top5 <- exam %>%
  arrange(desc(total)) %>%
  head(5)

View(top5)


group <-  exam %>%
  group_by(class) %>%
  summarise(mean_math = mean(math))
View(group)




View(mpg)


# 제조사별 도시연비 평균 출력

producer <- mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty))

View(producer)



# =======================================================

test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,70,80,90,100))

test1

test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(10,20,39,49,59))

test2

total <- left_join(test1, test2, by = "id")

total

#========================================================
exam <-  read_excel("excel_exam.xlsx")


name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("k", "p", "l", "c", "o"))

exam_new <- left_join(exam, name, by = "class")
View(exam_new)


#=======================================================
# 세로 합치기

g_a <- data.frame(id = c(1,2,3,4,5),
                  test = c(10,20,30,40,50))

g_a

g_b <-  data.frame(id = c(6,7,8,9,10),
                   test = c(30,40,50,60,70))

g_b

g_all <- bind_rows(g_a, g_b)

g_all

g_all <-  g_all %>% arrange(test)
g_all


View(mpg)
table(mpg$fl)


# c= 1200, d= 1300, e = 1400, p = 1500, r= 1600

mpg$fl_price <- ifelse(mpg$fl == "c" , 1200 ,
                       ifelse(mpg$fl == "d" , 1300 , 
                              ifelse(mpg$fl == "e", 1400,
                                     ifelse(mpg$fl =="p",1500,1600))))


mpg
View(mpg)


fuel <- data.frame(fl = c("c","d","e","p","r"),
                   fl_price = c(1200,1300,1400,1500,1600),
                   stringsAsFactors = F)
fuel
str(fuel)
mpg_fl <- left_join(mpg, fuel, by = "fl")
View(mpg_fl)


#===========================================================

View(midwest)
table(midwest$state)

test <- midwest %>%
  group_by(state) %>%
  summarise(mean(poptotal))
View(test)
