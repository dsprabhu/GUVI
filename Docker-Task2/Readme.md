## Task Description:

### Create a dockerfile, docker-compose file which when executed must display your basic details in the website.

### 1) Create a Dockerfile under docker-task2 directory to use nginx image, index template file with nginx startup script.
/////
FROM nginx:alpine

# Copy the startup script and template
COPY start.sh /start.sh
COPY index.template.html /index.template.html

# Make the script executable
RUN chmod +x /start.sh

# Run the script before starting nginx
CMD ["/bin/sh", "-c", "/start.sh && nginx -g 'daemon off;'"]
////////

### 2) Create a docker-compose.yml file and expose port 8080
////
version: '3'
services:
  container-info:
    build: .
    ports:
      - "8080:80"
////

### 3) capture realtime hostname and ipaddress of container in index template file.
////
<!DOCTYPE html>
<html>
<head>
  <title>Docker task 2</title>
</head>
<body>
  <h1>Welcome to demo site for docker task2</h1>
  <p><strong>Hostname:</strong> {{HOSTNAME}}</p>
  <p><strong>IP Address:</strong> {{IP}}</p>
</body>
</html>
//////

### 4) use script file to capture hostname,ip and write it to index.html
////
#!/bin/sh

# Get hostname and IP
HOSTNAME=$(hostname)
IP=$(hostname -i)

# Replace the value
sed "s/{{HOSTNAME}}/$HOSTNAME/g; s/{{IP}}/$IP/g" /index.template.html > /usr/share/nginx/html/index.html
////

### 5) use docker-compose to build and up container.