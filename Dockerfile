FROM nginx:latest
COPY -r ./site-content /usr/share/nginx/html/index.html

