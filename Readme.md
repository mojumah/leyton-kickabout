This is a website with details of the leyton kickabout football game.
Deploy the docker container using the deploy-container.sh command, this command will map index.html files from the Docker host into the Nginx container.

To do:

1- Docker image
2- Enable https
3- Add DB for players


So you want to deploy this in another region for example Japan.

## sudo docker login
## sudo docker pull jumahmohammad/leyton-orient
## sudo docker run --name game -p 80:80 -d jumahmohammad/leyton-orient 


Other details, I thought I could deploy using the -v mount command in deploy.sh in 30 minutes. 

But I endd up expermenting with docker for more than 8 hours, to get the above few commands to work, and deploy a containarized application.

What I still have to test is if there is if the JS in the HTML caused the -v mount command not to mount site-content to /us/share/nginx/html in the cotainer ?? or is this error region specific, less likely but test and verify,

I used docker logs

I used docker exec -it container-name /bin/bash

and could not see volume mappings, so the solution was to use a Dockerfile to build an image. Then run a container based on that image. Then I pushed my own image to the dockerhub, and used my own image instead of Nginx to spin up the cotainer. 

1- Launche an EC2 instance in Osaka


2- Use git clone, to download the repository.

3- Push using the command:

git push https://token:<token\>@github.com/mojumah/leyton-kickabout.git

4- install docker using the install script

5- start the container using the deploy script 

The docker run command -v was not mounting the site-content dir to /usr/share/nginx/html on the container.

So I had to deploy using option 2 which is the Docker file as documented in 


https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/

# sudo docker ps -a
# sudo docker stop container-name
# sudo docker rmi image-name
# sudo docker system prune

# docker build -t mynginx_image1 .
# docker run --name mynginx3 -p 80:80 -d mynginx_image1

I then logged in to docker using docker login

and followed this blog to push an image into docker hub

https://techtutorialsite.com/docker-push-images-to-dockerhub/

Now to deploy, you have to pull my docker image 

#docker pull jumahmohammad/leyton-orient

Then use the docker run command to run a container based on my image

#docker run --name container-name -p 80:80 -d jumahmohammad/leyton-orient


Remember, that a Dockerfile includes instructions that are used to build an image using #docker build

Then a container is crated based on the image using #docker run


You took an image of nginx on June 2022, and copied your basic html into it. Now the speed of development and changes of nginx will not affect your html development. The html should always work in the future when used with my own image of nginx. 

If I am using nginx's container specially the latest then the deploment might not work. Similar to how I could not map the volumes in the Japan region. Probably because of the Java Script in the html ?

What I also learned in this development that because he image is basd on Linux, with the pinguine logo visible in the docker hub, this means that I can do a docker pull, and docker build on any Linux flavour. Wheather that was Fedora, Debian, Ubuntu, Suze, Mint, etc.

It does not matter, and there is no need to remember that yum is for Fedora, and apt is for Ubuntu...

If you have docker installed, all you need to do do do the deployment is pull my image and run docker run based on my image.

You can deploy on any OS in any region that has docker. Similar to how phsyical containers can be deployed on trains, or ships, or on the ground. Containers are easily portable and deployable on any OS that has docker installed on it. This gives developers the time to focus on the application, and not on the infra structure the application is deployed on.

So go on, and start developing in the application layer, for example create that mind blowing idea of an RDS that gets you bds or people or that SQL DB wih books, maybe in docker, or that local Jenkins in a raspberrry pi that shows a web page in an intranet ...
