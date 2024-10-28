// ecosystem.config.js: Configuración de PM2

module.exports = {
  apps: [
    {
      name: "mi-servidor",             // Nombre de la aplicación
      script: "./app.js",               // Archivo principal de la aplicación
      instances: "max",                 // Usar todos los núcleos disponibles (modo cluster)
      exec_mode: "cluster",             // Modo de ejecución en clúster
      watch: true                       // Reinicia el servidor si hay cambios en el código
    }
  ]
};
