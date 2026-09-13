FROM nginx:1.27-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY nginx/vigil.conf /etc/nginx/conf.d/vigil.conf
COPY nginx/relay.conf /etc/nginx/conf.d/relay.conf
COPY public /usr/share/nginx/html

EXPOSE 8080
