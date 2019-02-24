# install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
# install.packages("readxl")
library(readxl)

raw_welfare <- read.spss(file="C:/Users/pc/Documents/빅데이터R/day04/day04/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)

welfare <- raw_welfare

# head(welfare)
# tail(welfare)
# View(welfare)
# dim(welfare)
# str(welfare)
# summary(welfare)

welfare <- rename(welfare, 
                  gender = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job=h10_eco9,
                  code_region=h10_reg7
)

colnames(welfare)

head(welfare$gender)

# > count(welfare, gender)
# # A tibble: 2 x 2
#   gender     n
#    <dbl> <int>
# 1      1  7578
# 2      2  9086

# table(welfare) =>데이타의 양이 많아 너무 오래 걸림. 
# table(welfare$gender)
# 
class(welfare$gender)
str(welfare$gender)
# > class(welfare$gender)
# [1] "numeric"
# > str(welfare$gender)
#  num [1:16664] 2 2 1 1 2 1 2 2 1 2 ...
#  
welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)

table(is.na(welfare$gender))

# > welfare$gender <- ifelse(welfare$gender == 9, NA, welfare$gender)
# > table(is.na(welfare$gender))
# FALSE 
# 16664 
# 

welfare$gender <- ifelse(welfare$gender == 1, '남', '여')
table(welfare$gender)
# > welfare$gender <- ifelse(welfare$gender == 1, '남', '여')
# > table(welfare$gender)
# 
#   남   여 
# 7578 9086 

qplot(welfare$gender)


# 성별 변수 전처리 작업 완료
# 


class(welfare$income)
summary(welfare$income)

qplot(welfare$income)
welfare$income <- ifelse(welfare$income %in% c(0,9999),NA, welfare$income )
table(is.na(welfare$income))


# 성별 월급의 비교
# 1. NA는 빼고 분석!
# 2. 성별로 그룹!(dplyr)
# 3. 평균!

gender_income <- welfare %>% 
                 filter(!is.na(income)) %>% 
                 group_by(gender) %>% 
                 summarise(mean_income = mean(income))
gender_income

ggplot(data= gender_income, aes(x = gender , y= mean_income )) +  
  geom_col()


qplot(welfare$birth)


welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)

qplot(welfare$age)

# 나이별 평균 월급 na제거
# 나이별
# 평균 월급
# 시각화까지(시계열로!: geom_line())


age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>% 
  summarise(mean_age_income = mean(income))

age_income

ggplot(data = age_income ,aes(x =age, y = mean_age_income)) +
  geom_line()


# 연령대별
# 평균 월급

welfare <- welfare %>% 
  mutate(age2 = ifelse(age < 30, "young",
                      ifelse(age<=59, "middle", "old")))

welfare$age2

table(welfare$age2) # 빈도수 정리 테이블
summary(welfare$age2)
qplot(welfare$age2)

age2_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age2) %>% 
  summarise(mean_age2_income = mean(income))

ggplot(data = age2_income ,aes(x =age2, y = mean_age2_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

# 연령대 성별 평균 수입

income2 <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age2, gender) %>% 
  summarise(mean_income2 = mean(income))

income2

ggplot(data = income2 ,aes(x =age2, y = mean_income2, fill = gender)) +
  geom_col() +
  scale_x_discrete(limits = c("young","middle","old"))


# 나이 + 성별 평균 월급의 흐름을 알고 싶습니다.
# 분석 후 시각화(시계열로!)
# 시계열인 경우 fill 옵션 대신, "col=" 사용

gender_age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age,gender) %>% 
  summarise(mean_gender_age_income = mean(income))

age_income

ggplot(data = gender_age_income ,aes(x =age, y = mean_gender_age_income, col = gender)) +
  geom_line()


#############################
list_job <- read_excel("C:/Users/pc/Documents/빅데이터R/day04/day04/Koweps_Codebook.xlsx") 

list_job
head(welfare$code_job)

welfare <- left_join(welfare, list_job, id = "code_job")

head(welfare$job)

age4_income <- welfare %>%
  filter(!is.na(income) & !is.na(job)) %>%
  group_by(job) %>% 
  summarise(mean_income6 = mean(income))

age4_income %>%
  arrange(desc(mean_income6)) %>% 
  head(10)
