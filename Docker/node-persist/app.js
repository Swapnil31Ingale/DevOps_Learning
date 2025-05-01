const fs = require('fs');
const path = require('path');
const http = require('http');

const filePath = path.join(__dirname, 'data', 'counter.txt');

// Ensure data directory and file exist
fs.mkdirSync(path.dirname(filePath), { recursive: true });
if (!fs.existsSync(filePath)) fs.writeFileSync(filePath, '0');

const server = http.createServer((req, res) => {
  let count = parseInt(fs.readFileSync(filePath, 'utf-8'));
  count += 1;
  fs.writeFileSync(filePath, count.toString());
  res.end(`Counter: ${count}`);
});

server.listen(3000, () => {
  console.log('Server running at http://localhost:3000');
});

