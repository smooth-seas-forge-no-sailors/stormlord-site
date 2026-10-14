FROM nginx:1.29-alpine AS ci

COPY --chmod=0644 index.html stormlord-logo.png stormlord-logo.svg /usr/share/nginx/html/
RUN test -s /usr/share/nginx/html/index.html && nginx -t

FROM nginx:1.29-alpine

COPY --from=ci /usr/share/nginx/html/ /usr/share/nginx/html/
