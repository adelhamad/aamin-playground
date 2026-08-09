# Built by aamin from this repository's own Dockerfile (dockerfileMode: "repo").
FROM nginx:alpine
COPY site/ /usr/share/nginx/html/
EXPOSE 80
