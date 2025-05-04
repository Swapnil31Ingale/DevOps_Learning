# Stage 1: Build
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Stage 2: Runtime
FROM node:20-slim

WORKDIR /app

# Only copy the necessary output from the builder stage
COPY --from=builder /app /app

EXPOSE 3000

CMD ["node", "app.js"]

