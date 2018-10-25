# Access static files in linux using nginx 

### Pre-requisites:
 - Static files located in /logs path 
 - Docker is running 
 > Path can be anywhere. Make the changes accordingly in nginx.conf and Docker file


### Build Docker Image

nginx can also be run as a system service with same nginx configuration. nginx docker container since is lighter and allows to run on any port.  

  - Clone github repo - `git clone https://github.com/rashidcmb/nginx-logs.git`
  - Run `docker build -t nginx-logs .` 
        This will create the nginx image and pull in the necessary dependencies. 
  - Verify docker image has been created by running `docker images | grep nginx-logs`
 
> Docker image will be created with Dockerfile and copied nginx.conf file inside the container

### Run Docker Container
Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 80 of the host to port 80 of the Docker

```sh
docker run -d -p 80:80 --restart="always" -v /logs:/logs logs
```
Change `-p` parameter to change the exposed port. Format for the same `-p host-port:container-port`

Verify the deployment by navigating to your server address in your preferred browser.
```sh
127.0.0.1:8080
```

Alternatively you can run the container directly by pulling my public docker image as below

### docker run -d -p 80:80 --restart="always" -v /logs:/logs rashiddocker/nginx-logs

Change '-p' parameter to change the exposed port. Format for the same -p host-port:container-port
Change '-v' parameter to change the directory that you would like to browse via browser however files will be always accessible with apending '/logs' to host as 'http://IP:port/logs'
