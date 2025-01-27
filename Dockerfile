FROM nginx:latest
COPY /build /usr/share/nginx/html/
EXPOSE 80
