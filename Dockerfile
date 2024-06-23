FROM node:22.3.0-slim

RUN apt-get update && apt-get update -y

RUN mkdir -p /app
WORKDIR /app

COPY . /app

RUN npm install
RUN npm run build
EXPOSE 4173

CMD ["npm", "run", "preview"]