ROM debian
RUN apt update -y
RUN apt install python3 python3-pip -y
RUN pip3 install kaggle
COPY kaggle.json /root/.kaggle/
RUN kaggle datasets download  sudalairajkumar/novel-corona-virus-2019-dataset
RUN apt install unzip -y
RUN unzip novel-corona-virus-2019-dataset.zip
