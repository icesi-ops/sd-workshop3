FROM python
LABEL mail: javierandrestorresreyes@gmail.com

#Copy the contents of the current directory into /app in the container
COPY . /app

#Installs pip requirements from /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

EXPOSE 8080

#Run the python script as entrypoint
CMD ["python3", "/app/sources/microservice_a.py"]
