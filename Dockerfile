#Pull node image from docker hub
FROM node:12.17.0

#Author
MAINTAINER Madhan Rajendran

#Switch the working Directory inside the container
WORKDIR /opt/simple_app/

#Copy RESTful API code 
ADD node-restful-api-tutorial/* ./

#Install npm
RUN npm install

#Expose
EXPOSE 3000/tcp

#Start the application (App URL: http://localhost:8080/)
CMD [ "node", "server.js" ]

