const http = require('http');

const server = http.createServer((req, res) => {
  res.end('Hello from API service');
});

server.listen(4000, () => {
  console.log('API service running on port 4000');
});

