# 1. 크롤링(웹)
# 2. 특정한 웹 : 요청을 하면 내 R프로그램에 넣어주기도 함.
# 3. 특정한 웹 : 다운로드


# 수집 --> 데이터프레임(표)
#         dplyr %>% (파이프 연산자)
#         시각화

# install.packages("dplyr")


# 웹에서 크롤링: 웹문서를 분석 --> 추출
# 웹문서(HTML) : <>

# <font size="6" class= "percent"> 미세먼지 농도 높음</font>
# 태그(메타데이터)

# CSS : percent 클래스 태그의 텍스트는 다 그린으로 스타일 셋팅

# 네이버 뮤직 크롤링 데이터 --> 표(데이터 프레임)
#    열1 열2
# 행1
# 행2

# 순위 노래제목 회사 가수 ...
# 1      AAA     A    AA
# 2      BBB     B    BB


install.packages("rvest")
library(rvest)
url = "http://music.naver.com/listen/top100.nhn?domain=DOMESTIC&duration=1h";
download.file(url,destfile = "navermusic.html",quiet = T);
naver_music <- read_html("navermusic.html");

ranking <- naver_music %>% 
  html_nodes("._tracklist_move .ranking") %>% 
  html_text() %>% 
  as.numeric()

ranking

gap <- naver_music %>% 
  html_nodes("._tracklist_move .change") %>% 
  html_text() %>% 
  gsub(pattern="\r\n||\t||\n", replacement="")  # HTML로 만들면서 군더더기를 없애는 함수

gap

title <- naver_music %>% 
  html_nodes("._tracklist_move ._title span") %>% 
  html_text() %>% 
  gsub(pattern="\r\n||\t||", replacement="") %>% 
  trimws()

title

artist <- naver_music %>% 
  html_nodes("._tracklist_move ._artist a") %>% 
  html_text() %>% 
  gsub(pattern="\r\n||\t||", replacement="") %>% 
  trimws()

artist

musicTop50<- data.frame(ranking,gap,title,artist, stringsAsFactors=F)
musicTop50
View(musicTop50) 


# 1. 네트워크로 연결
library(rvest)
library(dplyr)

# 2. 문서를 읽어야 한다. -- 램으로 보내기
url = "http://music.naver.com/listen/top100.nhn?domain=DOMESTIC&duration=1h";
download.file(url,destfile = "navermusic.html",quiet = T);
naver_music <- read_html("navermusic.html");

naver_music

# 3. 데이터 추출(열: 벡터), 전처리

# 순위




ranking <- naver_music %>% 
  html_nodes("._tracklist_move .ranking") %>% 
  html_text() %>% 
  as.numeric()

ranking

# 순위 변동

gap <- naver_music %>% 
  html_nodes("._tracklist_move .change") %>%  # change 가 한 군데에서만 쓰이면._tracklist_move .change 라고 쓸 필요 없이 .change
  html_text() %>% 
  gsub(pattern="\r\n||\t||\n", replacement="")  # HTML로 만들면서 군더더기를 없애는 함수

gap
# 문자 1,2,3, ...., 10 => 1, 10, 2, 3,

# 노래 제목

title <- naver_music %>% 
  html_nodes("._tracklist_move ._title span") %>% 
  html_text() %>% 
  gsub(pattern="\r\n||\t||", replacement="")%>% 
  trimws()

title

# 가수

artist <- naver_music %>% 
  html_nodes("._tracklist_move ._artist a") %>%  # a 태그 붙은 애들만 1-50이어서 붙인 것
  html_text() %>% 
  gsub(pattern="\r\n||\t||", replacement="")%>% 
  trimws()

artist

# 4. 데이터 프레임에 넣는다.

musicTop50<- data.frame(ranking,gap,title,artist, stringsAsFactors=F)
musicTop50

musicTop50 %>% head(5)
musicTop50 %>% tail(5)

View(musicTop50) 
