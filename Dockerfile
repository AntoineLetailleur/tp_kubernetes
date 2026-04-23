FROM node:22-alpine
WORKDIR /usr/src/app

# Installation des dépendances uniquement
COPY package*.json ./
RUN npm install --only=production

# Copie du code (le .dockerignore filtrera le reste)
COPY . .

EXPOSE 3000

# L'application cherchera /app/config/config.json dans le futur volume K8S
CMD ["node", "app/index.js"]