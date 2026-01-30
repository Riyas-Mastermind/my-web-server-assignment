FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y nginx

COPY index.html /var/www/html/index.html 
#copy our local HTML file to the default Nginx web folder

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
