# ReactJS - Docker



O jeito certo é criar utilizando o seguinte comando

docker run -it -v /home/adelino/Workspace/reacjs-docker:/usr/src/app -w="/usr/src/app" node:16.17.0 npx create-react-app .

sudo chown adelino reacjs-docker -R

Isso irá criar o projeto localmente sem o NOde instalado e a partir daí fé

Para rodar os arquivos Docker file e dokcer compose são




FROM node:16.17.0

WORKDIR /usr/src/app

COPY . .

RUN [ "npm", "install" ]




version: "3"

services:
    react:
        build: .
        volumes:
          - .:/usr/src/app
        ports:
          - 3000:3000
        command: npm start
        
        
        
        
        
1  
.dockerignore
@@ -0,0 +1 @@
**/node_modules
 25  
Dockerfile
@@ -0,0 +1,25 @@
FROM node:14.16.0

WORKDIR /usr/src/app/

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    vim \
    nano

ENV PATH /usr/src/app/node_modules/.bin:$PATH

RUN npm install -g npm@6.14.11

COPY package*.json /usr/src/app/

RUN mkdir /usr/src/app/node_modules

RUN chown node:node -R /usr/src/app/node_modules/

RUN npm install

RUN rm /usr/src/app/package-*.json

COPY . .
 13  
docker-compose.yml
@@ -0,0 +1,13 @@
version: "3"

services:
    reactjs:
        container_name: adota_pet
        build: .
        user: '1000'
        volumes:
          - '.:/usr/src/app'
          - '/usr/src/app/node_modules'
        ports:
          - '3000:3000'
        command: npm start
