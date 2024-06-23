FROM node:22.3.0-slim AS build

RUN apt-get update && apt-get install -y --no-install-recommends nginx

WORKDIR /app

COPY . /usr/share/nginx/html

RUN npm install

RUN npm run build

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

COPY default.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"] 
