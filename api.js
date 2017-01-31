var jsonServer = require('json-server');

// Return an Express server
var server = jsonServer.create();

// use default middleware
server.use(jsonServer.defaults());

// create routes based on data in `db.json`
var router = jsonServer.router('db.json');
server.use(router);

console.log('Maging happens on port 4000');
server.listen(4000);
