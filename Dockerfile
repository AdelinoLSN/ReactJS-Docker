FROM node:16.17.0

RUN apt-get -y update \
    && apt-get upgrade -y

RUN apt-get install -y \
    vim \
    nano

RUN mkdir /usr/src/app

COPY . /usr/src/app

WORKDIR /usr/src/app

RUN npm install