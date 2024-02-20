# Base image
FROM node:20 as build-stage

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Build your application
RUN npm run build

CMD ["npm", "start"]

EXPOSE 80
