# After the build step
FROM node:20  as build-stage

# Install a server to serve the static files
RUN npm install -g serve

# Copy the built files from the build-stage
COPY --from=build-stage /app/dist /dist

# Expose the port and start the server
EXPOSE 80
CMD ["serve", "-s", "dist", "-l", "80"]
