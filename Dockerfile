# Use a base image
FROM nginx:alpine

# Copy the web app files to the nginx default web root directory
COPY webapp /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Command to start the nginx server
CMD ["nginx", "-g", "daemon off;"]
