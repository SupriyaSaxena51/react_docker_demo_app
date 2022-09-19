#--------------Development Environment------------>
# base image
FROM node:alpine
# set working directory
WORKDIR /app
# install and cache app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install
# add app
COPY . .
EXPOSE 3000
# start app
CMD ["npm", "start"]

#--------------Production Environment------------>
# FROM node:alpine as builder
# WORKDIR /app
# COPY package.json ./
# COPY package-lock.json ./
# RUN npm install
# COPY . .
# RUN npm run build
# FROM nginx:1.17.10-alpine
# EXPOSE 80
# COPY --from=builder /app/build  /usr/share/nginx/html