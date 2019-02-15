library(foreign)    # SPSS 파일 불러오기
library(dplyr)      # 전처리
library(ggplot2)    # 시각화
library(readxl)     # 엑셀 파일 불러오기


raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = TRUE)


welfare <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  marriage = h10_g10,      # 혼인 상태
                  religion = h10_g11,      # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직종 코드
                  code_region = h10_reg7)  # 지역 코드

colnames(welfare)



list_job <- read_excel("Koweps_Codebook.xlsx",
                       col_names = TRUE, sheet = 2)

head(list_job)
View(list_job)
dim(list_job)
str(list_job)
welfare <- left_join(welfare, list_job, id = "code_job")


x <- welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)
View(x)



job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)
View(job_income)


top10 <- job_income %>%
  arrange(desc(mean_income)) %>%    # 정렬의 기준(내림차순)
  head(10)
View(top10)

ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) + geom_col()
ggplot(data = top10, 
       aes(x = reorder(job, mean_income), y = mean_income)) +geom_col() + coord_flip()

# Ⅵ. 성별 직업 빈도 ####
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>% 
  group_by(job) %>% 
  summarise(n = n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
View(job_male)
