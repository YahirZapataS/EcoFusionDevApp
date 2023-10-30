const express = require('express');
const app = express();
const port = 3000; // Puedes cambiar el puerto si lo deseas

app.get('/', (req, res) => {
  res.send('¡Hola, mundo!'); // Respuesta que se enviará al navegador cuando acceda a la ruta '/'
});

app.listen(port, () => {
  console.log(`Servidor iniciado en el puerto ${port}`);
});