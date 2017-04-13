FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx vim nano

COPY nginx.conf /etc/nginx/nginx.conf
ADD sites-enabled /etc/nginx/sites-enabled

RUN mkdir -p /var/log/nginx

WORKDIR /cms2

EXPOSE 80
EXPOSE 443

CMD ["nginx"]
