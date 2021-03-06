const express = require('express');
const app = express();
app.get('/', (req, res) => {
  res.set('Connection', 'close');
  res.set('Content-Type', 'application/json');
  res.send({ success: true, message: 'Hello World' });
});
app.listen(8000, () => {
  console.log('Express running at port 8000!');
});