const Koa = require('koa');
const Router = require('koa-router');
const app = new Koa();
const router = new Router();
router.get('/', ctx => {
  ctx.set('Connection', 'close');
  ctx.body = { success: true, message: 'Hello World' };
});
app.use(router.routes());
app.listen(8000, () => {
  console.log('Koajs running at port 8000');
});