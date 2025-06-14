# Stage 1: Build Angular App using ARM-compatible Node
FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build -- --configuration production

# Stage 2: Serve with ARM-compatible Nginx
FROM nginx:alpine
COPY --from=builder /app/dist/personalblog /usr/share/nginx/html
COPY nginx-custom.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
