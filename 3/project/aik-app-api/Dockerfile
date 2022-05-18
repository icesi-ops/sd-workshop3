# specify the node base image with your desired version node:<version>
FROM node:16

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

COPY . .

RUN npm install
COPY --chown=node:node . .

# replace this with your application's default port
EXPOSE 3000
CMD [ "node", "server.js" ]