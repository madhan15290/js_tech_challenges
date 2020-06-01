Introduction:
Dockerize a RESTFUL API with node.js

Getting Started:
1. git clone https://github.com/academind/node-restful-api-tutorial.git
2. Install docker engine (For installation per distro, refer: https://docs.docker.com/engine/install/)
3. Create Dockerfile - This file contains all the commands to build a docker image
4. Create docker-compose.yml file - This is a tool for defining and runnning docker containers using Docker file

Build and Test:
1. Run "docker-commpose up -d" to build and run a docker container (-d flag for detached mode)
2. Useful cmds:
     a. docker ps //lists all running container
     b. docker images //lists images
     c. docker-compose ps //to see what is currently running
3. Test your app via curl, browser., etc (eg: curl -vk http://<ip_address>:8080)






