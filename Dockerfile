FROM node:18

WORKDIR /app

# Install PNPM
RUN npm install -g pnpm

# Copy project
COPY . .

# Install dependencies for entire monorepo
RUN pnpm install --recursive

# Build all packages
RUN pnpm build

# Create directories that Flowise needs
RUN mkdir -p /opt/railway/.flowise/logs

# Expose port
EXPOSE 3000

# Start Flowise server
CMD ["pnpm", "start", "--prefix", "packages/server"]
