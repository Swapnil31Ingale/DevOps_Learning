const http = require('http');

const server = http.createServer((req, res) => {
  res.end('Hello from WEB service');
});

server.listen(3000, () => {
  console.log('Web service running on port 3000');
});

