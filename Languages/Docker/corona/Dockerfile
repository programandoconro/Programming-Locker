FROM debian
COPY kaggle.json /root/.kaggle/
RUN apt update -y
RUN apt install python3 python3-pip unzip -y
RUN pip3 install kaggle flask
RUN kaggle datasets download  sudalairajkumar/novel-corona-virus-2019-dataset && \
unzip novel-corona-virus-2019-dataset.zip
EXPOSE 5000
ADD app.py ./
ENTRYPOINT python3 app.py

