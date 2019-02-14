
library(ggplot2)
library(dplyr)
library(readxl)


# 이상치(Outlier) : 정상 범주에서 크게 벗어난 값###
# sex : 1(남자), 2(여자) --> 이상치 : 3
# score : 1~100          --> 이상치 : 120


outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(10,20,45,60,120,25))

View(outlier)

mean(outlier$score)
table(outlier$sex) # 이상치 발견


# 문제 1) 이상치는 NA로 표기해보세요

outlier$sex <- ifelse( outlier$sex == 1 | outlier$sex ==2, outlier$sex, NA)

outlier$score <- ifelse( outlier$score > 100 | outlier < 1, NA, outlier$score)

View(outlier)


###=========================== 20,30 남자키 평균, 2m이상
# 최홍만을 과연 배제하고 해야할까?
# 포함하지 않고 할 때에도 이상치로 보기도 함.
# ==> 이러한 숫자를 극단치라고 함
# 극단치 : 논리적으로 존재할 수 있지만, 극단적으로 크거나 작은 값
# 극단치 표현 : 상자그림(boxplot)

mpg

boxplot(mpg$hwy)
table(mpg$hwy)


# 14 이하 는 결측치 처리 // 32 이상은 결측치 처리
# 
# mpg$hwy <- ifelse( mpg$hwy <= 14, NA,
#                   ifelse(mpg$hwy >=32, NA, mpg$hwy ))

mpg$hwy <- ifelse( mpg$hwy <= 14 |mpg$hwy >=32, NA, mpg$hwy )

# mpg$hwy <- ifelse( is.na(mpg$hwy), sample(20:32,1), mpg$hwy )
# 데이터 쓸 일 있어서 na 없애려고 걍 맘대로 한거.



mpg$hwy
boxplot(mpg$hwy)










