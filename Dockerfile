# Dockerfile: Definición de la imagen de Docker

# Utilizar la imagen oficial de Node.js
FROM node:14

# Crear y definir el directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración y dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install -g pm2 && npm install

# Copiar todos los archivos de la aplicación
COPY . .

# Exponer el puerto 3000 para acceder al servidor
EXPOSE 3000

# Comando de inicio: usar PM2 para ejecutar el archivo de configuración
CMD ["pm2-runtime", "start", "ecosystem.config.js"]
