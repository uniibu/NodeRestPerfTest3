const fastify = require('fastify')();
// Declare a route
fastify.get('/', async (request, reply) => {
  reply.header('Connection', 'close')
    .send({ success: true, message: 'Hello World' });
});
// Run the server!
const start = async () => {
  await fastify.listen(8000);
  console.log(`Fastify listening on ${fastify.server.address().port}`);
};
start();