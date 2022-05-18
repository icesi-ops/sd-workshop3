Instructions

1. docker network create python-redis-net
2. docker run --network python-redis-net -p 6379:6379 --name python-redis -h python-redis -d redis 
2. docker run --network python-redis-net -p 5000:5000 --name python_flask_app -d gallo9923/python_flask_app

Note: Check photo.png to see the container running.