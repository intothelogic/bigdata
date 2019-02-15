# ifelse() 함수 : ifelse(조건식  ,참값 , 거짓값)
x <-3
ifelse(x %%2 == 0 , "even" , "odd")

x <- 1:5
ifelse(x %%2 == 0, "even" , "odd")
x

x <- data.frame(aa = c("a" , "b" , "c" , "d") ,
                bb = 1:4)
x

x[x$bb,]
x[x$bb>=3,]
x[x$aa == "b",]
x[x$aa != "b",]
x[(x$bb > 1) & (x$bb <4) , ]



data(women)
women
nrow(women)
ncol(women)
women$ABC <- ""
women

for(i in 1:nrow(women)){
  if(women[i,1] > mean(women$height)){
    women[i,3] <-"A"
  }
}
women
