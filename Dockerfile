# Define the build stage
FROM node:20 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Define the production stage
FROM node:20
# Install a server to serve the static files
RUN npm install -g serve
# Copy the built files from the build-stage
COPY --from=build-stage /app/dist /dist
# Expose the port and start the server
EXPOSE 80
CMD ["serve", "-s", "dist", "-l", "80"]
