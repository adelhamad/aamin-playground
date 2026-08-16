# Production UI variant. Build with: docker build -f production.Dockerfile -t aamin-playground:production .
FROM nginx:alpine
LABEL io.aamin.playground.variant="production"

RUN rm -rf /usr/share/nginx/html && mkdir -p /usr/share/nginx/html
COPY site/production.html /usr/share/nginx/html/index.html
RUN grep -Fq '<title>Production build' /usr/share/nginx/html/index.html

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --start-period=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ | grep -Fq '<title>Production build' || exit 1
