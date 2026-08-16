# Preview UI variant. Build with: docker build -f preview.Dockerfile -t aamin-playground:preview .
FROM nginx:alpine
COPY site/preview.html /usr/share/nginx/html/index.html
EXPOSE 80
