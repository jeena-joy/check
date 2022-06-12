FROM node:14.6
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app/
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8000
CMD [ "node", "./dist/Server.js" ]
