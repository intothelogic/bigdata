# 파일명 : polt2.R
# 1. 파이차트(원형 그래프) ####
x <- c(9, 15, 20, 6)
label <- c("영업1팀","영업2팀","영업3팀","영업4팀")
pie(x, labels = label, main = "부서별영업실적")
pie(x, labels = label, main = "부서별영업실적",
    clockwise = TRUE)
pie(x, labels = label, main = "부서별영업실적")
pie(x, labels = label, main = "부서별영업실적",
    init.angle = 90)
? pie()
pct <- round(x/sum(x)*100)
label <- paste(label, pct)
label <- paste(label, "%", sep = "")
pie(x, labels = label, main = "부서별영업실적",
    init.angle = 90,
    col = c("red","yellow","green","blue"))
pie(x, labels = label, main = "부서별영업실적",
    init.angle = 90,
    col = rainbow(length(x)))
pie(rep(1,12), labels = seq(1,12), col = rainbow(12)) # 무지개색
pie(rep(1,12), labels = seq(1,12), col = heat.colors(12)) # 적색과 황색 
pie(rep(1,12), labels = seq(1,12), col = terrain.colors(12)) # 지형 색
pie(rep(1,12), labels = seq(1,12), col = topo.colors(12)) #  청색계열 색
pie(rep(1,12), labels = seq(1,12), col = cm.colors(12)) # 핑크블루 색
# 3D 파이 ####
install.packages("plotrix")
library(plotrix)
pie3D(x, labels = label, explode = 0.1, labelcex = 0.8,
      main = "부서별 영엽 실적")
# RGB 변환 사이트 ####
# https://www.rapidtables.com/convert/color/index.html
colors()    # R기본 색상명 : 657가지 색 지원

# 2. 바 차트(스택형/그룹형) ####
h1 <- c(4,18,5,8)     # 2017년 실적
h2 <- c(9,15,20,6)    # 2018년 실적
h <- rbind(h1, h2)
h
legend_lbl <- c("2017년", "2018년")             # 범례 라벨
name <- c("영업1팀","영업2팀","영업3팀","영업4팀") # 그룹명 
barplot(h, main = "부서별 영업 실적",
        names.arg = name,
        xlab = "부서", ylab = "영업 실적(억원)",
        legend.text = legend_lbl,
        ylim = c(0, 35),
        col = c("darkblue", "red"),
        args.legend = list(x = 'top'))
barplot(h, main = "부서별 영업 실적",
        names.arg = name,
        xlab = "부서", ylab = "영업 실적(억원)",
        legend.text = legend_lbl,
        ylim = c(0, 35),
        col = c("darkblue", "red"),
        args.legend = list(x = 'bottomright'))       
barplot(h, main = "부서별 영업 실적",
        names.arg = name,
        xlab = "부서", ylab = "영업 실적(억원)",
        legend.text = legend_lbl,
        ylim = c(0, 35),
        col = c("darkblue", "red"),
        args.legend = list(x = 'bottomright'),
        beside = TRUE)

# 3. 일반 X-Y 플로팅 ####
women
weight <- women$weight
height <- women$height
plot(weight)
plot(height)
plot(height, weight, xlab = "키", ylab = "몸무게")
plot(height, weight, xlab = "키", ylab = "몸무게", 
     type = "p") # 점
plot(height, weight, xlab = "키", ylab = "몸무게", 
     type = "l") # 선
plot(height, weight, xlab = "키", ylab = "몸무게", 
     type = "b") # 점과 선
plot(height, weight, xlab = "키", ylab = "몸무게", 
     type = "c")
plot(height, weight, xlab = "키", ylab = "몸무게", 
     type = "o")
plot(height, weight, xlab = "키", ylab = "몸무게", 
     type = "h")
# type : "p","l","b","c","o","h","s","S","n"
plot(height, weight, xlab = "키", ylab = "몸무게",
     pch = 23, col = "blue", bg = "yellow",
     cex = 1.5)

# 4. 히스토그램 ####
quakes         # 지진의 강도 데이터 세트
colnames(quakes)
mag <- quakes$mag
mag            # 지진의 강도 

barplot(mag, main = "지진 발생 강도의 분포", 
        xlab = "지진 강도", ylab = "발생 건수")
hist(mag, main = "지진 발생 강도의 분포", 
     xlab = "지진 강도", ylab = "발생 건수")
colors <- c("red","orange", "yellow","green","blue","navy","violet")
hist(mag, main = "지진 발생 강도의 분포", 
     xlab = "지진 강도", ylab = "발생 건수",
     col = colors, breaks = seq(4.0, 6.5, by = 0.5))
hist(mag, main = "지진 발생 강도의 분포", 
     xlab = "지진 강도", ylab = "발생 건수",
     col = colors, breaks = seq(4.0, 6.5, by = 0.5),
     freq = FALSE) # T(빈도수), F(확률밀도)

# 6. 박스플롯 
mag <- quakes$mag
summary(mag)
quantile(mag, c(0.25, 0.5, 0.75))
boxplot(mag, main = "지진 발생 강도의 분포",
        xlab = "지진", ylab = "발생 건수",
        col = "red")
