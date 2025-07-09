# syntax=docker/dockerfile:1

###############################################################################
# 1) Builder stage: install dev deps, compile & bundle the NestJS app
###############################################################################
FROM node:20-alpine AS builder

# Set working dir
WORKDIR /usr/src/app

# Copy lockfile(s) and root package manifests
COPY package.json package-lock.json nx.json tsconfig.base.json ./

# Copy only the service folder and workspace libs needed for build
COPY apps/pt-notification-service ./apps/pt-notification-service
# (If you have shared libs, COPY libs ./libs)

# Install all dependencies (including dev)
RUN npm ci

# Build the NestJS app (uses the Nx CLI bundled in dev deps)
RUN npx nx build pt-notification-service --configuration production

###############################################################################
# 2) Production image: very slim, only prod deps + compiled output
###############################################################################
FROM node:20-alpine AS runner

WORKDIR /usr/src/app

# Copy only production package manifests
COPY package.json package-lock.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy the compiled bundle from builder
COPY --from=builder /usr/src/app/dist/apps/pt-notification-service ./

# (Optional) create non-root user for better security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose the port the app listens on
ENV PORT=3000
EXPOSE 3000

# Use the bundled entrypoint
CMD ["node", "main.js"]
