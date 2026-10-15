FROM nginx:1.29-alpine AS ci

COPY --chmod=0644 index.html stormlord-logo.png stormlord-logo.svg /usr/share/nginx/html/
RUN test -s /usr/share/nginx/html/index.html && nginx -t

FROM nginx:1.29-alpine

COPY --from=ci /usr/share/nginx/html/ /usr/share/nginx/html/

HEALTHCHECK --interval=5s --timeout=3s --start-period=2s --retries=12 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1
