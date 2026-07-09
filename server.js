const http = require('http');
const fs = require('fs');

const server = http.createServer((req, res) => {
  const filePath = 'c:\\Users\\HP\\Downloads\\certificado-autenticidad-v2.html';
  fs.readFile(filePath, (err, content) => {
    if (err) {
      res.writeHead(500);
      res.end('Error cargando el archivo html: ' + err.message);
    } else {
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
      res.end(content);
    }
  });
});

server.listen(3000, 'localhost', () => {
  console.log('HTTP Server running locally at http://localhost:3000/');
});
