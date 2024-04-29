FROM node:20

WORKDIR /usr/src/app
COPY index.js index.js
COPY package.json package.json

RUN npm install

EXPOSE 1050

CMD [ "index.js" ]
ENTRYPOINT [ "node" ]