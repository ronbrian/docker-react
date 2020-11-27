FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


#Second Phase
FROM nginx
#👇🏻👇🏻Copy from /app/build to nginx directorypwd for serving static html pages
COPY --from=0 /app/build /usr/share/nginx/html
