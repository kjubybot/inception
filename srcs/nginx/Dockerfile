FROM alpine

RUN apk add nginx

COPY default.conf /etc/nginx/http.d/
COPY tmeizo.42.fr.crt /
COPY tmeizo.42.fr.key /

CMD ["nginx", "-g", "daemon off;"]
