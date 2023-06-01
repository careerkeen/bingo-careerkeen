FROM node:18.16.0 as build

WORKDIR /

COPY package*.json .
RUN npm install --global gulp-cli
RUN npm install

RUN npm run build


FROM nginx:1.24

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /theme/angular-docker/ /usr/share/nginx/html