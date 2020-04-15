FROM debian:latest
RUN apt update -y && apt install r-base -y
RUN R -e "install.packages(c('randomForest','caret','neuralnet','e1071'))"
