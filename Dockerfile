# specify the node base image with your desired version node:<version>
FROM node:14

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install && npm audit fix
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

# replace this with your application's default port
EXPOSE 8080

CMD [ "node", "server.js" ]
