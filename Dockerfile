

FROM centos
RUN yum update && upgrade -y

# programas preferidos 
RUN dnf install git nano htop wget elinks python-pip R nmap vim -y

RUN /usr/bin/python2.7 -m pip install --upgrade --user virtualenv

#rstudio
RUN wget https://download1.rstudio.org/desktop/centos7/x86_64/rstudio-1.2.1335-x86_64.rpm
#rpm -i rstudio-1.2.1335-x86_64.rpm 

RUN /usr/bin/python2.7 -m pip install --upgrade --user virtualenv

RUN echo " local({
  r <- getOption('repos')
  r['CRAN'] <- 'http://cran.cnr.berkeley.edu/'
  options(repos = r)
}) ;
install.packages(c('keras','ggplot2',
'caret','e1071','randomForest','MASS',
'tensorflow','zoo','stringr','dplyr',
'lubridate','shiny','shinydasboard','neuralnet')) ; 
library(keras) ; library (tensorflow) 
install_keras() ; install_tensorflow() " > libs.R && Rscript libs.R

