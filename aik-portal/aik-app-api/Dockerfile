FROM node:latest
COPY . /app
WORKDIR /app
ENV PORT=3000
RUN npm install
EXPOSE 3000
CMD ["node","server"]
