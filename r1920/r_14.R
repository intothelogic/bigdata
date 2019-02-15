# '한국복지패널데이터'분석준비
# foreign패키지: SPSS,SAS,STATA등 통계분석 SW의 파일 읽기
install.packages("foreign")
library(foreign)    # SPSS 파일 불러오기
library(dplyr)      # 전처리
library(ggplot2)    # 시각화
library(readxl)     # 엑셀 파일 불러오기
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = TRUE)
welfare <-raw_welfare
dim(welfare)  
head(welfare)
tail(welfare)
str(welfare)
summary(welfare)
colnames(welfare)

welfare <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  marriage = h10_g10,      # 혼인 상태
                  religion = h10_g11,      # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직종 코드
                  code_region = h10_reg7)  # 지역 코드

# Ⅰ. 성별에 따른 월급 차이####
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
table(is.na(welfare$sex))
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex) 
qplot(welfare$sex)
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)  
qplot(welfare$income)  + xlim(0,1000)

summary(welfare$income)
# 이상치(1~9998) -> 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0,9999), 
                         NA, welfare$income)

table(is.na(welfare$income))
# 성별(~별,~끼리끼리) 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>%   # 4620개 자료 filter(!is.na(income)==T)
  group_by(sex) %>%
  summarise(mean_income = mean(income))
sex_income 
ggplot(data = sex_income, aes(x=sex, y=mean_income)) + 
  geom_col()

# Ⅱ. 태어난 연도 -> "나이"와 월급의 관계 ####
class(welfare$birth)
table(welfare$birth)
summary(welfare$birth)  
qplot(welfare$birth)  
table(is.na(welfare$birth)) 

welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)  

table(is.na(welfare$birth))

welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

# 나이에 따른 월급 평균표
age_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))
View(age_income)
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_col()


# Ⅲ. 연령대(ageg)(초년, 중년, 노년)에 따른 월급 차이 ####
# 초년("young") : 30세 미만
# 중년("middle") : 30~59세
# 노년("old") : 60세 이상

welfare <- welfare %>%
  mutate(ageg = ifelse(welfare$age < 30, "young", 
                       ifelse(welfare$age < 60, "middle", "old")))

table(welfare$ageg) 
qplot(welfare$ageg) 
# 연령대(ageg)(초년, 중년, 노년)에 따른 월급 차이 표

ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))
ageg_income
ggplot(data = ageg_income, aes(x = ageg, y= mean_income)) + geom_col()
ggplot(data = ageg_income, aes(x = ageg, y= mean_income)) + geom_col() + 
  scale_x_discrete(limits = c("young","middle","old"))

# Ⅳ. 연령대 및 성별 월급 차이 ####
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
sex_income

ggplot(data = sex_income, aes(x = ageg, y = mean_income,
                              fill = sex
                              )) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))



ggplot(data = sex_income, aes(x = ageg, y = mean_income,
                              fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old")) 

# 나이 및 성별 월급 차이 ####
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))
head(sex_age)
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()


# Ⅴ. 직업별 월급 차이 ####

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = TRUE)

welfare <- raw_welfare


class(welfare$h10_eco9)
class(welfare$code_job)
table(welfare$code_job)


welfare <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  marriage = h10_g10,      # 혼인 상태
                  religion = h10_g11,      # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직종 코드
                  code_region = h10_reg7)  # 지역 코드

library(foreign)    # SPSS 파일 불러오기
library(dplyr)      # 전처리
library(ggplot2)    # 시각화
library(readxl)     # 엑셀 파일 불러오기

list_job <- read_excel("Koweps_Codebook.xlsx",
                       col_names = TRUE, sheet = 2)


head(list_job)
View(list_job)
dim(list_job)
str(list_job)
welfare <- left_join(welfare, list_job, id = "code_job")


# 직업코드에 해당하는 직업명
x <- welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)
View(x)


class(welfare$code_job)

# 직업별 월급 차이 평균표
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)
View(job_income)



# 하위 추출
top10 <- job_income %>%
  arrange(mean_income) %>%    # 정렬의 기준(기본 : 오름차순)
  head(10)
View(top10)

# 상위 10위 추출
top10 <- job_income %>%
  arrange(desc(mean_income)) %>%    # 정렬의 기준(내림차순)
  head(10)
View(top10)

ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) + geom_col()
ggplot(data = top10, 
       aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()


# 하위 10위 추출
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)
bottom10

ggplot(data = bottom10, aes(x = reorder(job, -mean_income), y = mean_income)) + 
  geom_col() + 
  coord_flip() +
  ylim(0, 850)
# Ⅵ. 성별 직업 빈도 ####
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
View(job_male)












