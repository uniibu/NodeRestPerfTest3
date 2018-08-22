const http = require('http');
http.createServer((request, response) => {
  response.setHeader('Connection', 'close');
  response.setHeader('Content-Type', 'application/json; charset=utf-8');
  response.setHeader('Content-Length', 40);
  response.end(JSON.stringify({ success: true, message: 'Hello World' }));
}).listen(8000);