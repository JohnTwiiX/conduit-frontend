# Step 1: Build Angular 
FROM node:20.9.0 AS build

WORKDIR /app

COPY . $WORKDIR

ARG API_URL

RUN npm install -g yarn --force && \
    yarn install && \
    node set-env.js && \
    yarn build

# Step 2: Nginx for Serving 
FROM nginx:1.26.2-alpine
COPY --from=build /app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80
