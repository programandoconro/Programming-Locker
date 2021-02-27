FROM python

COPY main.py .

RUN apt update -y

RUN python3 -m pip install mysql-connector-python flask

ENTRYPOINT python3 main.py 
