This is a website with details of the leyton kickabout football game.
Deploy the docker container using the deploy-container.sh command, this command will map index.html files from the Docker host into the Nginx container.

To do:

1- Docker image
2- Enable https
3- Add DB for players


So you want to deploy this in another region for example Japan.

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
