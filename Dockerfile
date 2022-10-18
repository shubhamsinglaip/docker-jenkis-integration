FROM ubuntu:20.04



RUN apt update && apt install -y nginx && service nginx start



WORKDIR /ujwal



ADD index.html .



RUN cat index.html > /var/www/html/index.nginx-debian.html



CMD ["bash"]



EXPOSE 8082
