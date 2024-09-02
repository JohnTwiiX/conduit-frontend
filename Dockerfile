
FROM node:20.9.0 AS build
# Step 1: Build Angular 
WORKDIR /app
COPY . .
RUN npm install -g yarn --force
RUN yarn install
RUN yarn build

# Step 2: Nginx for Serving 
FROM nginx:alpine
COPY --from=build /app/dist/angular-conduit /usr/share/nginx/html
EXPOSE 80
