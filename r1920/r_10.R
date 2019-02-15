#### 이상치(Outlier) : 정상 범주에서 크게 벗어난 값 ####
# sex : 1(남자), 2(여자) --> 이상치 : 3
# score : 1~5            --> 이상치 : 6
outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier
mean(outlier$score)
table(outlier$sex)    # 이상치 확인
table(outlier$score)

# 이상치 처리 (이상치->결측치)
table(outlier$sex)
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
table(outlier$sex)
outlier$sex <- ifelse(outlier$sex >= 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)

outlier

library(dplyr)
# 성별에 따른 점수의 평균
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>%
  group_by(sex) %>%
  summarise(mean_score= mean(score))
boxplot(outlier)

#### 극단치 : 논리적으로 존재할 수 있지만, 
####          극단적으로 크거나 작은값 
#### 극단치 표현 : 상자그림(boxplot) 
library(ggplot2)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
# 극단치 처리 (극단치->결측치)
mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy > 37, NA, mpg$hwy)

mpg$hwy <- ifelse(mpg$hwy >= 12 & mpg$hwy <= 37, mpg$hwy, NA)

table(is.na(mpg$hwy))
mpg  %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy, na.rm = TRUE))
View(mpg)





