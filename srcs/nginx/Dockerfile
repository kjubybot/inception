FROM alpine

RUN apk add nginx

RUN mkdir /var/run/nginx
COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
