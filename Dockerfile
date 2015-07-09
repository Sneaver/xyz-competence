# Use the standard nodejs image as a base
FROM node

# Install production dependencies.
ADD package.json /app/package.json
RUN cd /app && npm install --production

# Add the rest of the project to a folder app in the container.
ADD . /app

# Add configuration file for the api url
ADD server/conf/api-url-prod.js /app/server/dist/js/app-url.js

# Set working directory for the app:
WORKDIR /app

# Expose the correct port for your app. This will be picked up by "Katalog" who
# will make sure Nginx redirects to this port. 
EXPOSE 9000

CMD node /app/server/server.js
