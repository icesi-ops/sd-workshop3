# Microservices

![alt text](https://i.ibb.co/3cQdDny/microservices.png)

There is no accepted definition of a microservice, you will find for example:
- > "Small autonomous services that work together" By: Sam Newman  
- > "In short, the microservice architectural style is a approach to developing a single application as a suite  of small services, each running in its own process and communicating with lightweight mecahcnism, often and HTTP..."  
- > "There is a bare minimun of centralized management of these services, which may be written in different programming languages and use different data storage technologies" by: Martin Fowler  

- REST
- And Small whell chosen deployable units
- And cloud enabled

### How Does it Look?

![alt tex](https://i.ibb.co/CWvrFry/microservices2.png)

## Microservices Advantages

- New Technology and Process Adaption
- Dynamic Scaling
- Faster Release Cycles

## Microservices Challenges

- Bounded Context:  ¿How do you identify the boundary for each os these microservices?  ¿How do you identify what to do in each of these microservices?  ¿How do you decide what you should do and what no?
- Configuration Management
- Dynamic Scale Up and Scale Down
- Visibility: If I say the functionality is now distributed among 10 microservices and there is a bug, How do you identify where the bug is?  
- Pack of cards: How do i prevent one microservices being down taking down entire application? ¿How do i build fault-tolerance?

### How we can solve all those challenges?

- CONTAINERIZATION
- ORCHESTATION

![alt text](https://i.ibb.co/8mbbpJ2/microservices3.png)

### References
· https://www.geeksforgeeks.org/todo-list-app-using-flask-python/
· https://github.com/cosmoshadab/todo-app-flask
· https://github.com/bhavaniravi/flask-tutorial/blob/master/app/app.py


## Project Overview

This repository contains the implementation of a microservices-based system for managing invoices. The system utilizes Docker containers for deploying microservices and databases, including MySQL, PostgreSQL, and MongoDB.

### Project Components

- **Microservices Images**: Docker images for microservices used in the system.
- **Database Images**: Docker images for MySQL and PostgreSQL databases.
- **MongoDB Schema**: Blank schema for MongoDB.
- **Invoice Spring Project**: A Spring project for managing invoices.

### Detailed Explanation

#### Microservices Images

The microservices images are containerized applications that handle specific functionalities within the system. Each microservice is designed to be independent and scalable. By containerizing them, we ensure consistency and ease of deployment across different environments.

#### Database Images

The database images include Docker configurations for MySQL and PostgreSQL. These are essential for storing and managing data related to invoices. Dockerizing databases simplifies the setup process and allows for easy replication and scaling as needed.

#### MongoDB Schema

The MongoDB schema provided here serves as a starting point for integrating MongoDB into the system. MongoDB is a NoSQL database that offers flexibility in handling unstructured data, making it suitable for certain use cases within the invoice management system.

#### Invoice Spring Project

The Invoice Spring project is a key component of the system, built using the Spring framework. It addresses a specific requirement related to invoice registration. Previously, the registration modal did not allow for balance subtraction or tracking state changes. The modifications made to this project enable these functionalities, enhancing the overall functionality and usability of the system.
