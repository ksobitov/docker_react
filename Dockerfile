FROM node:20.10.0-alpine as builder

WORKDIR /usr/src/app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
