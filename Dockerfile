# Stage 1: Build with Bun
FROM oven/bun:alpine AS builder
WORKDIR /app
COPY . .
RUN bun install \
  && bun run build

# Stage 2: Final image with PocketBase
FROM alpine:3.17
ARG BUILDARCH=amd64
ARG PB_VERSION=0.22.17

# Install dependencies, download, unzip PocketBase, and clean up in a single RUN command
RUN apk add --no-cache \
  unzip \
  ca-certificates \
  curl \
  && curl -fSL https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_${BUILDARCH}.zip -o /tmp/pb.zip \
  && unzip /tmp/pb.zip -d /app/ \
  && chmod +x /app/pocketbase \
  && rm /tmp/pb.zip \
  && rm /app/CHANGELOG.md /app/LICENSE.md \
  && apk del unzip curl

# Copy built files from the builder stage
COPY --from=builder /app/pb/pb_public /app/pb_public
COPY --from=builder /app/pb/pb_hooks /app/pb_hooks
COPY --from=builder /app/pb/pb_migrations /app/pb_migrations

# Define the mount point as a volume
VOLUME ["/app/pb_data"]

# Expose the application port
EXPOSE 8080

# Set the command to run the application
CMD ["/app/pocketbase", "serve", "--http=0.0.0.0:8080"]
