FROM nginx:1.25.1-alpine
COPY ./.nginx/default.conf /etc/nginx/conf.d/default.conf
COPY /apps/rider-app/build/web /usr/share/nginx/html