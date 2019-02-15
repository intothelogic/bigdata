library(ggplot2)

View(mpg)
data_point = data.frame(xx=1:10,
                        yy =sample(1:10,10))
data_point
ggplot(data = data_point, aes(x = xx, y = yy)) 
? ggplot()
ggplot(data = mpg, aes(x = displ, y = hwy))
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() +
  xlim(3,6)
ggplot(data = mpg, aes(x = displ, y = hwy)) +  #데이터, 축
  geom_point() +                               #그래프 종류
  xlim(3,6) +                                  #세부 설정
  ylim(10,30)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
ggplot(mpg, aes(displ, hwy)) + geom_point()
? geom_point()
ggplot() + geom_point(data = mpg, aes(x = displ, y = hwy))
ggplot() + geom_point(data = mpg, aes(displ, hwy))
ggplot() + geom_point(mpg, aes(displ, hwy))
library(dplyr)
df_mpg <- mpg %>%
  group_by(drv) %>%                 # 구동방식별 
  summarise(mean_hwy = mean(hwy))    # 고속도로연비의 평균 
View(df_mpg)

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy),
                          y = mean_hwy)) + geom_col()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_col() 
# 빈도 막대 그래프
ggplot(data = mpg, aes(x = displ)) + geom_bar()

# 선 그래프
# economics : 미국 경제 지표들을 월별로 나타낸 데이터
View(economics)
colnames(economics)
ggplot(data = economics, aes(x = date, y= unemploy)) + geom_line()
# 상자 그림 : 데이터분포 
ggplot(data = mpg, aes(drv, hwy)) + geom_boxplot()
ggplot(data = mpg, aes(drv, hwy)) + geom_col()
