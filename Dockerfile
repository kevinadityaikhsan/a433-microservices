# Use Node.js v14 as the base image
FROM node:14

# Define the working directory within the container
WORKDIR /src

# Copy package definition files into the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Download the wait-for-it.sh script for service readiness checks
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Grant execution permissions to the script
RUN chmod +x ./wait-for-it.sh

# Copy the main application file into the working directory
COPY index.js ./

# Define the application port as an environment variable
ENV PORT=3000

# Expose the defined port to the host
EXPOSE $PORT

# Run the application after verifying RabbitMQ is accessible
CMD ["sh", "-c", "./wait-for-it.sh my-rabbitmq:5672 --timeout=30 -- node index.js"]
