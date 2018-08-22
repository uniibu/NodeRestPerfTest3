const restify = require('restify');

function respond(req, res, next) {
  res.set('Connection', 'close');
  res.send('Hello World!');
  next();
}
const server = restify.createServer();
server.get('/', respond);
server.listen(8000, () => {
  console.log('%s listening at %s', server.name, server.url);
});