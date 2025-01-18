From nginx:alpine
COPY . /usr/share/nginx/html/
RUN rm -rf /usr/share/nginx/html/index.html
RUN mv /usr/share/nginx/html/Index.html /usr/share/nginx/html/index.html