From nginx:alpine
RUN rm -rf /usr/share/nginx/html/index.html
COPY . /usr/share/nginx/html/