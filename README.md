# Proyecto Node.js con PM2 en Docker

Este proyecto es un servidor básico de Node.js ejecutado en un contenedor Docker, utilizando PM2 como administrador de procesos. PM2 proporciona varias ventajas para la administración de aplicaciones en producción, como la ejecución en modo clúster, reinicio automático y monitoreo en tiempo real.

## Requisitos

- Docker instalado en tu máquina
- Node.js y PM2 (opcional para pruebas locales)

## Instalación y Configuración

### 1. Clonar el repositorio

Clona este repositorio en tu máquina local y navega al directorio del proyecto:

```bash
git clone https://github.com/usuario/proyecto-pm2.git
cd proyecto-pm2
```

### 2. Construir la imagen de Docker

Para construir la imagen Docker del proyecto, usa el siguiente comando:

```bash
docker build -t proyecto-pm2 .
```

### 3. Ejecutar el contenedor

Ejecuta el contenedor en segundo plano con el siguiente comando:

```bash
docker run -d --name mi-contenedor -p 3000:3000 proyecto-pm2
```

Ahora puedes acceder a la aplicación en `http://localhost:3000`.

## Archivos Importantes

- `app.js`: Servidor Node.js básico que responde con "¡Hola, mundo!".
- `Dockerfile`: Define la imagen de Docker para este proyecto.
- `ecosystem.config.js`: Configuración de PM2 para ejecutar el servidor en modo clúster.

## Características de PM2 en este proyecto

PM2 añade varias ventajas al manejo de la aplicación:

1. **Ejecución en clúster**: Con `instances: "max"`, PM2 ejecuta el servidor en todos los núcleos de CPU disponibles, mejorando el rendimiento en sistemas multinúcleo.

2. **Reinicio automático**: Si el servidor falla, PM2 lo reinicia automáticamente.

3. **Monitoreo de la aplicación**: PM2 permite monitorear el uso de CPU y memoria de la aplicación en tiempo real.

4. **Actualización en caliente**: Con `watch: true`, PM2 reinicia automáticamente la aplicación si detecta cambios en el código.

## Ejecución de Comandos de PM2 en Docker

Para ejecutar comandos de PM2 dentro del contenedor, puedes usar los siguientes métodos:

### Método 1: Acceder a la Terminal del Contenedor

1. Accede a la terminal del contenedor en ejecución:
   ```bash
   docker exec -it mi-contenedor sh
   ```

2. Luego, dentro de la terminal del contenedor, puedes ejecutar comandos de PM2 como:
   ```bash
   pm2 list
   pm2 logs
   pm2 monit
   ```

### Método 2: Ejecutar Comandos de PM2 Directamente desde Fuera del Contenedor

Ejecuta los comandos de PM2 directamente desde fuera del contenedor usando `docker exec`:

```bash
docker exec -it mi-contenedor pm2 list
docker exec -it mi-contenedor pm2 logs
docker exec -it mi-contenedor pm2 monit
```

## Comandos útiles de PM2 (para pruebas locales)

Si deseas probar la aplicación en tu entorno local con PM2, estos comandos son útiles:

- Iniciar la aplicación:
  ```bash
  pm2 start ecosystem.config.js
  ```

- Ver el estado de la aplicación:
  ```bash
  pm2 list
  ```

- Ver logs de la aplicación:
  ```bash
  pm2 logs
  ```

- Monitorear el rendimiento de la aplicación:
  ```bash
  pm2 monit
  ```

- Detener la aplicación:
  ```bash
  pm2 stop mi-servidor
  ```

- Reiniciar la aplicación:
  ```bash
  pm2 restart mi-servidor
  ```

## Escalabilidad

PM2 escala la aplicación para utilizar todos los núcleos de CPU disponibles, ejecutando múltiples instancias del servidor en un único contenedor Docker. Esto mejora el rendimiento y la disponibilidad del servidor.

## Contribuciones

Las contribuciones son bienvenidas. Puedes realizar un fork del proyecto, crear una nueva rama con tus cambios y enviar un pull request para revisarlo.

## Licencia

Este proyecto se distribuye bajo la licencia MIT.