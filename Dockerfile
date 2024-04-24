FROM node:18.12.1

# Set the working directory
WORKDIR /app

# Copy the package.json file to the container
# we need to copy the package.json file first to avoid reinstalling all dependencies
# since dockerfile have a cache mechanism, if the package.json file has not changed, the dependencies will not be reinstalled
COPY package*.json ./

# Install any dependencies
RUN npm install

# Copy the rest of the application files to the container
COPY . .

# 建立 Swagger 文件
RUN npm run swagger

# Expose the necessary ports
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]