Sebastian Navia.

First make sure that the databases are turned on so that the services can connect to them.

We turn on mysql for the pay microservice, we turn on MongoDb for the transaction microservice, we turn on postgres for the invoice microservice.

We also turn on kafka to fulfill its broker function.

For the postgres and mysql we create their respective images:

POSTGRES:

Go to the folder resorces/mysql

- docker build -t sebastiannavia/postgres
- docker push sebastiannavia/postgres
- docker run -p 5432:5432 --name postgres --network distribuidos -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=db_invoice -d sebastiannavia/postgres

MYSQL:

Go to the folder resorces/mysql

- docker build -t sebastiannavia/mysql
- docker push sebastiannavia/mysql
- docker run -p 3306:3306 --name mysql --network distribuidos -e MYSQL_ROOT_PASSWORD=mysql -e MYSQL_DATABASE=db_operation -d sebastiannavia/mysql

run MongoDB:

- docker run -p 27017:27017 --network distribuidos --name mongodb -d mongo

![imagen](https://github.com/Sebastianavia/sd-workshop3/assets/71205906/0a2995b9-8633-4290-8263-67758860526a)

Run Kafka

- docker run -p 2181:2181 -d -p 9092:9092 --name servicekafka --network distribuidos -e ADVERTISED_HOST=servicekafka -e NUM_PARTITIONS=3 johnnypark/kafka-zookeeper:2.6.0


Then we raise the services. For example; We create the app-config image, then we upload it and finally we run it. - Keep in mind that to create and upload the image we must be inside the service folder, in this case app-config.

- docker build -t sebastiannavia/app-config .
- docker push sebastiannavia/app-config
- docker run -d -p 8888:8888 --network distribuidos --name app-config sebastiannavia/app-config

For the other services it would be the same process, only the port described in the dockerfile of each service changes and at the time of running the service.

![imagen](https://github.com/Sebastianavia/sd-workshop3/assets/71205906/237bb5f1-b711-45a8-88ee-ccee99f09232)

We observe that all our services are uploaded, and although it is not necessary for this delivery, we can verify that the services are in operation thanks to the consul.

![imagen](https://github.com/Sebastianavia/sd-workshop3/assets/71205906/0df3cae5-61e6-475f-80c1-77afa2633192)

In order for the service to work, only a part of the code was changed into:
app-invoice/src/main/java/kafka/consumer/

![imagen](https://github.com/Sebastianavia/sd-workshop3/assets/71205906/22b59062-ac03-4c4e-bdc7-bafe1ac9277a)





