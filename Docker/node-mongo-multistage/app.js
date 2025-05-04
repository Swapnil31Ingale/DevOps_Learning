const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Node.js with multi-stage Docker build! 🚀');
});

app.listen(port, () => {
  console.log(`App running at http://localhost:${port}`);
});

