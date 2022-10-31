FROM python:3.7
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
ENV HOST="localhost"
ENV REDIS_PORT="6379"
ENV REDIS_DB="0"
#RUN export $(cat .env | xargs)
EXPOSE 3030
CMD ["python", "hello.py"]
