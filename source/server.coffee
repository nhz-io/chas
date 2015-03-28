net = require 'net'
Channel = require './channel'

module.exports = class Server extends net.Server
  constructor: ->
    @on 'connection', (socket) =>
      channel = new Channel socket:socket
      socket.on 'end', -> channel.close()
      @emit 'channel', channel
