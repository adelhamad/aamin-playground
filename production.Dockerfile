# Production UI variant. Build with: docker build -f production.Dockerfile -t aamin-playground:production .
FROM nginx:alpine
COPY site/production.html /usr/share/nginx/html/index.html
EXPOSE 80
