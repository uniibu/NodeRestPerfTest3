const http = require('http');
http.createServer((request, response) => {
  response.setHeader('Connection', 'close');
  response.end('Hello World!');
}).listen(8000);