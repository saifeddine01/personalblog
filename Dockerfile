# Use official Node.js base image for Raspberry Pi (64-bit)
FROM arm64v8/node:20

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Set the working directory inside the container
WORKDIR /app

# Copy only package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your Angular project
COPY . .

# Build the Angular app with production config
RUN ng build --configuration production

# Dummy CMD (container will exit after build)
CMD ["echo", "Angular production build complete"]



# Stage 1: Build Angular App using ARM-compatible Node
# FROM node:18-alpine AS builder
# WORKDIR /app
# COPY . .
# RUN npm install && npm run build -- --configuration production

# # Stage 2: Serve with ARM-compatible Nginx
# FROM nginx:alpine
# COPY --from=builder /app/dist/personalblog /usr/share/nginx/html
# COPY nginx-custom.conf /etc/nginx/conf.d/default.conf

# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]
