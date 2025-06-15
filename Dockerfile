# Base image: Use Node.js version 14
FROM node:14

# Set the working directory inside the container
WORKDIR /src

# Copy dependency definitions to the working directory
COPY package*.json ./

# Install project dependencies
RUN npm install

# Download the wait-for-it.sh utility script
RUN wget -O ./wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh

# Grant execute permissions to the wait-for-it.sh script
RUN chmod +x ./wait-for-it.sh

# Copy the application entry point to the working directory
COPY index.js ./

# Set the application port as an environment variable
ENV PORT=3001

# Open the defined port to the host
EXPOSE $PORT

# Start the application after ensuring RabbitMQ is available
CMD ["sh", "-c", "./wait-for-it.sh my-rabbitmq:5672 --timeout=30 -- node index.js"]
