# 리스트 
x <- list("홍길동" , "2018001" , 20 , c("IT융합" , "데이터관리"))
x
y <- list("성명" = "홍길동" , 
          "학번" = "2018002" , 
          "나이" = 20 , 
          "수강과목" = c("IT융합" , "데이터관리"))

y
y[1]
y["성명"]
y[["성명"]]
y$성명
# 데이터 프레임: 표형식

x <- data.frame(이름 = c("홍길동" , "손오공") , 
                나이 = c(20, 30) , 
                주소 = c("서울" , "부산"))
x
x <- cbind(x , 학과 = c("전산학" , "경영학"))

x
x <- rbind(x , data.frame(이름 = "장발장" , 
                            나이 = 40,
                            주소 = "경기" , 
                            학과 = "경영학") )
x
x[3,2]
x[3,]
x[,2]
x[-2]
x["학과"]
x[,4]

x[,2]
x["나이"]
x[,"나이"]
x$학과
x[1,2] <-10
x
View(x)
str(x)
x[1] <-lapply(x[1], as.character)
str(x)
x[4] <-lapply(x[4], as.character)
x[3] <-lapply(x[3], as.character)

x[3,4] <- "수학과"
x
str(x)
