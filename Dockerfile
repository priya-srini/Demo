# Use a lightweight web server image
FROM nginx:alpine

# Copy your HTML file into the web server's folder
COPY index.html /usr/share/nginx/html/
