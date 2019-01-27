# 외부 라이브러리 설치

# install.packages("glue")
# install.packages("ggplot2")


# 외부 라이브러리 사용
library(glue)
# library(glue2)

# 여기에 glue를 이용해서 프린트 연습
# temp 변수: 아무것도안붙어있음
#            정적인 값 저장
# temp() 함수: 동적인 처리


# 벡터만들어 보기
eyes <- c(10, 33, 44)

ages <- c(10, 30, 50)

# 할당 연산자 (alt + -)
# 평균  %>%  정렬  %>%  프린트
# 파이트연산자(ctrl + shift + m)   

ages[1]
ages[1] <- 20

# 이름 벡터를 만들고,
# 두번째 사람이 박아무개로 개명
# 이름의 전체 내용을 출력

names <- c("황우주", "강혜나", "강예서", "강예빈")
names[1]
names[2] <- "박아무개"
names[2]

ages[1]
