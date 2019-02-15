install.packages("foreign")
library(foreign)    # SPSS 파일 불러오기
library(dplyr)      # 전처리
library(ggplot2)    # 시각화
library(readxl)     # 엑셀 파일 불러오기
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", 
                         to.data.frame = TRUE)
welfare <- raw_welfare
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)    # 16664명(6914가구)  X 957
str(welfare)
summary(welfare)
colnames(welfare)
# 변수명(7개) 변경
welfare <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  marriage = h10_g10,      # 혼인 상태
                  religion = h10_g11,      # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직종 코드
                  code_region = h10_reg7)  # 지역 코드
welfare
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
table(is.na(welfare$sex))
table(welfare$sex) 
qplot(welfare$sex)
qplot(welfare$income) 
qplot(welfare$income)  + xlim(0,1000)
table(is.na(welfare$income)) 

# 성별(~별,~끼리끼리) 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>%   # 4620개 자료 filter(!is.na(income)==T)
  group_by(sex) %>%
  summarise(mean_income = mean(income))
sex_income  

ggplot(data = sex_income, aes(x=sex, y=mean_income)) + 
  geom_col()
