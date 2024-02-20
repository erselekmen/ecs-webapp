# Base image
FROM node:20 as build-stage

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build your application
RUN npm run build

# Start the application using npm or node command
# This assumes you have a script named "start" in your package.json,
# or you can directly use "node your-app-entry-file.js"
CMD ["npm", "start"]

# Expose the port your app runs on
EXPOSE 3000
