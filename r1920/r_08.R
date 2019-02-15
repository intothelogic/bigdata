
mpg_new <- mpg
mpg_new <- mpg_new %>% mutate(total = cty  +hwy)
mpg_new
mpg_new %>% select(total)
mpg_new
mpg_new <- mpg_new %>% mutate(mean = total/2)
mpg_new
mpg_new %>%
  arrange(desc(mean)) %>%
  head(3)

mpg %>%
  mutate(total = cty + hwy,
         mean = total/2) %>%
  arrange(desc(mean)) %>%
  head(3)


mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty))

mpg %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

mpg %>%
  group_by(manufacturer) %>%
  summarise(mean_hwy =mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

mpg %>%
  filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(count = n())%>%
  arrange(desc(count))

fuel <- data.frame(fl = c("c" , "d" , "e"  ,"p" , "r"),
                   price_fl = c(2.34,2.35, 2.11, 2.76,2.22),
                   stringsAsFactors = F)
fuel
mpg <-left_join(mpg , fuel , by = "fl")
mpg
mpg %>%
  select(model , fl , price_fl) %>%
  head(25)





