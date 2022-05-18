FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node

RUN npm install express --save
RUN npm i superagent
RUN npm install

COPY --chown=node:node . .
EXPOSE 3030
CMD [ "node", "server.js" ]