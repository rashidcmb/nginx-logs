FROM nginx:alpine
RUN apk add --no-cache --update apache2-utils
COPY nginx.conf /etc/nginx/
RUN chmod 0777 /etc/nginx/nginx.conf