# install.packages("ggplot2")
library(ggplot2)
library(dplyr)

# dplyr : 파이프 연산자 여러 연산 수행
# ggplot2 : 그래프/ 시각화 관련
# stringr : 문자열 추출
# rvest : 크롤링 관련

mpg
mpg <- as.data.frame(ggplot2::mpg)

mpg

ggplot(data= mpg, aes(x= displ, y = hwy)) + geom_point()


midwest <- as.data.frame(ggplot2::midwest)
midwest
ggplot(data = midwest, aes(x= poptotal, y = popasian)) + geom_point()



df_mpg <- mpg %>% 
          group_by(drv) %>% 
          summarise(mean_hwy = mean(hwy))
ggplot(data = df_mpg, aes(x= drv, y = mean_hwy)) +
       geom_col()


ggplot(data= mpg, aes( x= drv, y= hwy )) +
       geom_boxplot()
