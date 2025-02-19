# Use a lightweight Node.js image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy application code
COPY . .

# Set a non-root user for security
RUN addgroup appgroup && adduser -S -G appgroup appuser
USER appuser

# Expose the application port
EXPOSE 3000

# Command to run the application
CMD ["node", "server.js"]
