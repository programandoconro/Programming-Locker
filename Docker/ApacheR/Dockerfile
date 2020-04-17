FROM httpd:latest
RUN apt update -y && apt install r-base -y && \
R -e "jpeg('plot.jpg'); plot(1,1); dev.off()" && \
rm /usr/local/apache2/htdocs/index.html && \
cp plot.jpg /usr/local/apache2/htdocs/
