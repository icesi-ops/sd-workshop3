FROM python:latest
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY microservice_a.py ./

EXPOSE 8080

CMD [ "python", "./microservice_a.py" ]