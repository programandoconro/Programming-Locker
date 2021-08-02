FROM python
COPY . .
RUN pip3 install fastapi uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8787"]
