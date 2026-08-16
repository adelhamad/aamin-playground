# Preview UI variant. Build with: docker build -f preview.Dockerfile -t aamin-playground:preview .
FROM nginx:alpine
LABEL io.aamin.playground.variant="preview"

RUN rm -rf /usr/share/nginx/html && mkdir -p /usr/share/nginx/html
COPY site/preview.html /usr/share/nginx/html/index.html
RUN grep -Fq '<title>Preview build' /usr/share/nginx/html/index.html

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --start-period=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ | grep -Fq '<title>Preview build' || exit 1
