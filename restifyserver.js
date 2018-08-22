const restify = require('restify');

function respond(req, res, next) {
  res.set('Connection', 'close');
  res.send({ success: true, message: 'Hello World' });
  next();
}
const server = restify.createServer();
server.get('/', respond);
server.listen(8000, () => {
  console.log('%s running at %s', server.name, server.url);
});