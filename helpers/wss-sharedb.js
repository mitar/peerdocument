var WebSocket = require('ws');
var WebSocketJSONStream = require('websocket-json-stream');
var shareDBServer = require('./sharedb-server');
var debug = require('debug')('peerdocument:sharedb');
var uuid = require('uuid');

module.exports = function(server) {
  var wss = new WebSocket.Server({
    noServer: true
  });

  wss.on('connection', function(ws, req) {

    // generate an id for the socket
    ws.id = uuid();
    ws.isAlive = true;

    debug('A new client (%s) connected.', ws.id);

    var stream = new WebSocketJSONStream(ws);
    shareDBServer.listen(stream);

    ws.on('pong', function(data, flags) {
      debug('Pong received. (%s)', ws.id);
      ws.isAlive = true;
    });
  });

  // Sockets Ping, Keep Alive
  setInterval(function() {
    wss.clients.forEach(function(ws) {
      if (ws.isAlive === false) return ws.terminate();

      ws.isAlive = false;
      ws.ping('', false, true);
      debug('Ping sent. (%s)', ws.id);
    });
  }, 30000);

  return wss;
};
