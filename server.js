const jsonServer = require('json-server');

const server = jsonServer.create();
const route = jsonServer('db.json');
const middlewares = jsonServer.defaults();

//const port = process.env.PORT || 8080;

server.use(middlewares);
app.listen(process.env.PORT || 8080, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});