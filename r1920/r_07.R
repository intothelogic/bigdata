
mpg <- as.data.frame(ggplot2::mpg)
mpg
head(mpg)

# displ (배기량) , 평균

x <-mpg %>%filter(displ <= 4)
dim(x)
mean(x$hwy)

y <-mpg %>%filter(displ > 5)
y
dim(y)
mean(a$hwy)

# audi 와 toyota 중 도시연비 비교

audi <- mpg %>% filter(manufacturer =="audi")
mean(audi$cty)

toyota <- mpg %>% filter(manufacturer =="toyota")
mean(toyota$cty)

# ford , honda , audi

df <-mpg %>% select(class , cty)
colnames(df$class)
df$class

head(df)
dim(df)
df_suv <- df %>% filter(class == "suv")
df_suv

df_compact <- df %>% filter(class== "compact")
df_compact

mean(df_suv$cty)
mean(df_compact$cty)


mpg %>% filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>%
  head(5)

#============================================


