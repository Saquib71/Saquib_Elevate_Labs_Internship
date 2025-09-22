# Use official Nginx image
FROM nginx:alpine

# Copy HTML into Nginx default directory
COPY index.html /usr/share/nginx/html/index.html
