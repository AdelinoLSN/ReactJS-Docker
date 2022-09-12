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
