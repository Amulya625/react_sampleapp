# pull the base image
FROM node:14-alpine as build
# set the working direction
WORKDIR /app
# copy package.json
COPY package.json ./
COPY package-lock.json ./
# install app dependencies
RUN npm install
# add app
COPY . ./
RUN npm run build
FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]