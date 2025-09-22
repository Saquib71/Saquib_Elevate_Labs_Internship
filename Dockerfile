# Use official Nginx image
FROM nginx:alpine

# Copy HTML into Nginx default directory
COPY Index.html /usr/share/nginx/html/index.html
