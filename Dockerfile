# Using Node.js version 14 base image (Alpine Linux).
FROM node:14-alpine

# Setting the container working directory to /app.
WORKDIR /app

# Copying the source code to the working directory in the container.
COPY . .

# Setting the application to run in production mode.
# Using a container named item-db as the database host.
ENV NODE_ENV=production DB_HOST=item-db

# Installing production dependencies and then building the application.
RUN npm install --production --unsafe-perm && npm run build

# Exposing the application's port, which is 8080.
EXPOSE 8080

# Running the server when the container is launched.
CMD ["npm", "start"]
