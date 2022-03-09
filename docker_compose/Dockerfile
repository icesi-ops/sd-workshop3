FROM python:3.8-alpine

WORKDIR /usr/share/app
ADD . /usr/share/app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000
CMD ["python", "app.py"]
