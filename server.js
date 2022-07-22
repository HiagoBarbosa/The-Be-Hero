const jsonServer = require('json-server');

const server = jsonServer.create();
const route = jsonServer('db.json');
const middlewares = jsonServer.defaults();

const port = process.env.PORT || 8080;

server.use(middlewares);
server.use(route);
server.listen(port, ()=>{
    console.log(`JSON SERVER IS RUNNING IN ${port}`)
});