FROM python:3.7
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
RUN export $(cat .env | xargs)
EXPOSE 3030
CMD ["python", "hello.py"]
