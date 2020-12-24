FROM debian

RUN apt-get update && apt-get upgrade -y
RUN apt-get install r-base python-pip git -y 

RUN echo "install.packages(c('dplyr'))" > packages_R.R && Rscript packages_R.R
RUN echo "install.packages(c('zoo'))" > packages2_R.R && Rscript packages2_R.R
RUN echo "install.packages(c('lubridate'))" > packages3_R.R && Rscript packages3_R.R
RUN echo "install.packages(c('randomForest','e1071','neuralnet','caret'))" > packagesML.R && Rscript packagesML.R
RUN echo "install.packages(c('reticulate','keras'))" > packagesDL.R && Rscript packagesDL.R
RUN echo "install.packages(c('MASS','shiny','shinydashboard'))" > packages_compl.R && Rscript packages_compl.R

RUN pip install keras tensorflow  
RUN pip install scikit-learn torch
RUN pip install pandas matplotlib 
RUN apt-get install cmake
RUN pip install face_recognition 
