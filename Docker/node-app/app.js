const PORT = process.env.PORT || 3000;
const MESSAGE = process.env.MESSAGE || "Hello from Docker with updates!";

const http = require("http");

const server = http.createServer((req, res) => {
  res.end(`${MESSAGE} — ${new Date().toLocaleTimeString()}`);
});

server.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

