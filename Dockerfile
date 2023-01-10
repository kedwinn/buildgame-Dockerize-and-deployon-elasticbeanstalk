#### Specifies the base image and 
FROM ubuntu:22:04

#### Run executes a series of commands to update and install all nginx, zip and curl
RUN apt-get update
RUN apt-get-install -y nginx zip curl

#### 
RUN echo "daemon off;" >>/etc/nginx/nginx.conf

#### curl to get the github repo to the master directory
RUN curl -o /var/www/html/master.zip/ -L https://github.com/gabrielecirulli/2048.git
RUN cd /var/www/html/ && unzip master.zip && mv 2028-master/* . && rm -rf 2048-master master.zip

#### Expose the ports
EXPOSE 80

####
CMD ["usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]
