FROM node:20-slim

WORKDIR /app

# Copy dependency manifests
COPY package*.json ./

# Install npm dependencies
RUN npm install

# Copy application files
COPY . .

# Expose default port
EXPOSE 10000

# Start bot with memory optimization flags for Render free tier
CMD ["node", "--optimize_for_size", "--max-old-space-size=384", "--expose-gc", "src/index.js"]
