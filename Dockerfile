# Start from the official n8n image
FROM n8nio/n8n:latest

# Set required environment variables early so n8n picks them up
ENV N8N_EXTERNAL_URL=https://n8n-render-inofficial.onrender.com \
    N8N_PROTOCOL=https \
    N8N_PORT=5678 \
    N8N_HOST=0.0.0.0 \
    TZ=Europe/Stockholm

# Optional: set timezone in container
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Europe/Stockholm /etc/localtime && \
    echo "Europe/Stockholm" > /etc/timezone

# Start n8n
CMD ["n8n", "start"]
