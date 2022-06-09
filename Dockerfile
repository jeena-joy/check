FROM node:10.15

WORKDIR /usr/src/app

COPY package.json .
COPY package-lock.json .
COPY pm2.json .

RUN npm install pm2 -g
RUN npm install
COPY . .

RUN npm run deploy

# Show current folder structure in logs
RUN ls -al -R

EXPOSE 8080

CMD [ "pm2-runtime", "pm2.json" ]
