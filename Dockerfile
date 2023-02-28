FROM node:alpine AS build 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# copy build folder created by npm run build from build step to nginx folder
COPY --from=build /app/build /usr/share/nginx/html
# start nginx