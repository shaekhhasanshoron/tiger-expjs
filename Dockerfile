FROM node:13

ARG NEXUS_NPM_GROUP_URL
ARG NEXUS_TOKEN

WORKDIR /usr/src/app
COPY package*.json ./

RUN npm config set registry $NEXUS_NPM_GROUP_URL
RUN npm config set _auth $NEXUS_TOKEN

RUN npm install
COPY . .
EXPOSE 8080
ENTRYPOINT ["npm", "start"]


