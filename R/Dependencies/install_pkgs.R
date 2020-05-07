# Dependencias:
if(FALSE) {

'* deb: libssl-dev (Debian, Ubuntu, etc)
 * rpm: openssl-devel (Fedora, CentOS, RHEL)
 * csw: libssl_dev (Solaris)
 * brew: openssl@1.1 (Mac OSX)

 * deb: libcurl4-openssl-dev (Debian, Ubuntu, etc)
 * rpm: libcurl-devel (Fedora, CentOS, RHEL)
 * csw: libcurl_dev (Solaris)
 '

}
####################################################

requirements <- c('tidyverse','randomForest','ipred','tm',
'rpart', 'xgboost', 'dplyr', 'twitteR','stringr','lubridate',
'dplyr','ggthemes','wordcloud','data.table','SnowballC' )

pack <- requirements[!requirements %in% installed.packages()[,"Package"]]

if( length(pack)>0 ) { install.packages(pack) } else {
    print('Todas las dependencias están instaladas')
}

for (i in requirements){ 
  library(i, character.only = TRUE)
  print(c(i,"OK"))
 
}
