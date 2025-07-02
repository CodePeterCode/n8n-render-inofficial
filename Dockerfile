FROM n8nio/n8n:latest

# Byt till root för att kunna installera systempaket
USER root

# Installera rätt tidszon
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Europe/Stockholm /etc/localtime && \
    echo "Europe/Stockholm" > /etc/timezone

# Byt tillbaka till node-användare (som n8n kör som)
USER node

# Sätt viktiga miljövariabler (exempel)
ENV N8N_EXTERNAL_URL=https://n8n-render-inofficial.onrender.com \
    N8N_PROTOCOL=https \
    N8N_PORT=5678 \
    N8N_HOST=0.0.0.0 \
    TZ=Europe/Stockholm

# Starta n8n
CMD ["n8n", "start"]
