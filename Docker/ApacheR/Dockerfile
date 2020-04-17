FROM httpd:latest
RUN apt update -y && apt install r-base -y
RUN R -e "jpeg('plot.jpg'); plot(1,1); dev.off()"
RUN rm /usr/local/apache2/htdocs/index.html
RUN cp plot.jpg /usr/local/apache2/htdocs/
