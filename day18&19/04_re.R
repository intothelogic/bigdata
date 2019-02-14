# View(mpg)

data_point <- data.frame(xx=1:10, yy = sample(1:10,10))
data_point

ggplot(data = data_point, aes(x = xx, y = yy)) # 표 만들기

ggplot(data = data_point, aes(x = xx, y = yy)) + geom_point() # 점 그리기

?geom_point
?ggplot


ggplot(data = mpg, aes(x = displ, y = cty))


ggplot(data = mpg, aes(x = displ, y = cty)) + geom_point()


ggplot(data = mpg, aes(x = manufacturer, y = cty)) + geom_point()


ggplot(data = mpg, aes(x = displ, y = cty)) + geom_point() + xlim(3,6)
ggplot(data = mpg, aes(x = displ, y = cty)) + geom_point() + ylim(20,30)



df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

View(df_mpg)

ggpplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()

ggpplot(data = mpg, aes(x = displ, y = hwy)) + geom_col()
 
ggpplot(data = mpg, aes(x =displ)) + geom_bar() # 갯수


# 선 그래프
# economics : 미국 경제 지표들을 월별로 나타낸 데이터
View(economics)
colnames(economics)
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

# 상자 그림 : 데이터 분포

ggplot(data = mpg, aes(drv, hwy)) + geom_boxplot() 

ggplot(data = mpg, aes(drv, hwy)) + geom_col()




