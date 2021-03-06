'use strict';
const Hapi = require('hapi');
// Create a server with a host and port
const server = Hapi.server({
  host: 'localhost',
  port: 8000
});
// Add the route
server.route({
  method: 'GET',
  path: '/',
  handler(request, h) {
    return h.response({ success: true, message: 'Hello World' }).header('Connection', 'close', { append: true });
  }
});
// Start the server
async function start() {
  try {
    await server.start();
  } catch (err) {
    console.log(err);
    process.exit(1);
  }
  console.log('HapiJs running at:', server.info.uri);
}
start();