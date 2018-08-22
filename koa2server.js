const Koa = require('koa');
const app = new Koa();
app.use(ctx => {
  ctx.set('Connection', 'close');
  ctx.body = 'Hello World!';
});
app.listen(8000, () => {
  console.log('Koajs running at port 8000');
});