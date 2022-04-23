FROM node:latest
WORKDIR /app

COPY package.json ./
ADD public ./public
RUN npm install

COPY server.js ./

EXPOSE 3030

CMD [ "node", "server.js" ]