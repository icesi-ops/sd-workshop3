# Get started 

# Building (optional)
```bash
cd aik-app-api
docker build -t sebasgarciamo/aik-app-api .

cd aik-app-ui
docker build -t sebasgarciamo/aik-app-ui .
```

# Run containers 
```bash
docker pull sebasgarciamo/aik-app-api
docker pull sebasgarciamo/aik-app-ui

docker network create aik

docker run -p 3000:3000 \
    -e NODE_ENV=dev \
    -e PORT=3000 \
    --name aik-app-api \
    --hostname backend \
    --network aik \
    -d \
    sebasgarciamo/aik-app-api

docker run -p 3030:3030 \
    --name aik-app-ui \
    --hostname frontend \
    -e BACK_HOST=backend \
    --network aik \
    -d \
    sebasgarciamo/aik-app-ui
```

# Evidences

## Containers running
![docker ps](evidences/docker_ps.png)

## API
![API working](evidences/api_working.png)

## UI
![UI working](evidences/ui_working.png)
![UI working 2](evidences/ui_working2.png)

# Aik-portal

Current State
![Current state](images/3.png)

![Current state](images/2.png)

Desired State
![Desired state](images/1.png)
