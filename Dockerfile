FROM node:18.14.0 as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
RUN npm install -g serve
RUN serve -s build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html