# Built by aamin from this repository's own Dockerfile (dockerfileMode: "repo").
FROM nginx:alpine
LABEL io.aamin.playground.variant="default"

RUN rm -rf /usr/share/nginx/html && mkdir -p /usr/share/nginx/html
COPY site/index.html /usr/share/nginx/html/index.html
RUN grep -Fq '<title>Default build' /usr/share/nginx/html/index.html

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --start-period=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ | grep -Fq '<title>Default build' || exit 1
