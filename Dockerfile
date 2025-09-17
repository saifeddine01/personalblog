# ============================
# Stage 1: Build Angular app
# ============================
FROM arm64v8/node:20 AS builder

# Set working directory
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy project files and build Angular app
COPY . .
RUN npm run build -- --configuration production

# ============================
# Stage 2: Serve with Nginx
# ============================
FROM arm64v8/nginx:stable-alpine

# Copy built Angular files to Nginx html folder
COPY --from=builder /app/dist/* /usr/share/nginx/html/

# Copy custom Nginx config if needed
# (optional, can skip if default config works)
# COPY nginx-custom.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
