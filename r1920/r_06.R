
library(readxl)
exam <- read_excel("excel_exam.xlsx")
exam

exam %>%  
  mutate(total = math+english+science) %>%
  head
exam
exam %>%
  mutate(total = math+english+science,
         mean = (math+english+science)/3) %>% head


exam <- exam %>%
  mutate(test = ifelse(science>=80, "pass", "fail")) %>%
  head
exam

top5 <- exam %>%
  mutate(total = math+english+science,
         mean = (math+english+science)/3) %>% 
  arrange(desc(total)) %>%
  head(5)
top5 
# 집단별(그룹별, ~별) 요약(합계, 평균, 갯수, 최대, 최소)하기
# 전체 수학점수 평균
exam <- read_excel("excel_exam.xlsx")

exam %>% summarise(mean(math))
exam %>% summarise(mean_math = mean(math))



exam %>% 
  group_by(class) %>%
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())          # 빈도 : 인원수(학생수)

# 데이터 합치기 ####
# 가로로 합치기
test1 <- data.frame(id = c(1,2,3,4,5), 
                    midterm = c(60,80,70,90,85))

test2 <- data.frame(id = c(1,2,3,4,5), 
                    final = c(70,83,65,95,80))

total <- left_join(test1, test2, by = "id")
total

# 다른데이터를 활용해 변수 추가하기
name  <- data.frame(class = c(1,2,3,4,5),
                    teachar = c("kim","lee","park","choi","jung"))
name

exam
exam_new <- left_join(exam, name, by = "class")
exam_new


# 세로로 합치기
group_a <- data.frame(id = c(1,2,3,4,5), 
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10), 
                      test = c(70,83,65,95,80))
group_all <- bind_rows(group_a, group_b)

group_all
# pipe operator(%>%) 입력 단축키 : Ctrl+Shift+M
group_all %>% arrange(test)