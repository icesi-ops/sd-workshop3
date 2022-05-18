FROM node:lts-alpine
COPY . /app
WORKDIR /app
RUN npm install
ENV PORT=8089
EXPOSE 8089
CMD ["npm","start"]
